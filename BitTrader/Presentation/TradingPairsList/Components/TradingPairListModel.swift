//
//  TradingPairListModel.swift
//  BitTrader
//
//  Created by user on 19.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation
import UIKit
import Charts

protocol TradingPairListModelDelegate: class {
    func tickerDidChange(_ ticker: BSTicker) -> Void
}

class TradingPairListModel {
    
    var theClosure: (([BSTransactionsHistory]) -> ())?
    
    var exchangeTitle: String  = "Bitstamp"
    
    var currency: String {
        return pair.name
    }
    
    var currentValue: String {
        return ticker?.roundedNumber() ?? ""
    }
    
    var percentValue: String {
        if let percentage = ticker?.calculatedPercentage() {
            return String(percentage) + " %"
        }
        return ""
    }
    
    var rawPercentage: Double {
        return ticker?.calculatedPercentage() ?? 0.0
    }
    
    var urlSymbol: String {
        return pair.url_symbol
    }
    
    var transactionDate: String {
        if let transactions = self.transactions {
            for transaction in transactions {
                return transaction.date
            }
        }
        return "empty"
    }
    
    public weak var delegate: TradingPairListModelDelegate?
    
    
    private var pair: BSTradingPair
    private var ticker: BSTicker?
    private var transactions: [BSTransactionsHistory]?
    
    private let exchangeProvider: ExchangeProvider
    
    var timer: Timer?
    
    public init(pair: BSTradingPair, exchangeProvider: ExchangeProvider) {
        self.pair = pair
        self.exchangeProvider = exchangeProvider
        
        self.exchangeProvider.getTicker(for: self.pair) { (ticker, error) -> (Void) in
               if let ticker = ticker {
                   self.ticker = ticker
                   self.delegate?.tickerDidChange(ticker)
               }
        }
        
        self.exchangeProvider.getTransactions(for: self.pair) { (transactions, error) in
            if let transactions = transactions {
                self.transactions = transactions
                self.theClosure?(transactions)
               // print(transactions)
                
            }
        }
        
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            
            self.exchangeProvider.getTicker(for: self.pair) { (ticker, error) -> (Void) in
                if let ticker = ticker {
                    self.ticker = ticker
                    self.delegate?.tickerDidChange(ticker)
                }
            }
        }
        self.timer = timer
    }
    
    func getTransactionData(pairList: TradingPairListModel, completion: @escaping ([ChartDataEntry])->Void){
        var transactionsValues = [ChartDataEntry]()
        let pair = pairList.pair
        exchangeProvider.getTransactions(for: pair) { (transactions, error) in
            if let transactions = transactions {
                self.transactions = transactions
                //print(transactions)
                for transaction in transactions.reversed() {
                    if let date = Double(transaction.date), let price = Double(transaction.price){
                        let value = ChartDataEntry(x: date, y: price)
                        transactionsValues.append(value)

                    }
                }
                completion(transactionsValues)
            }
        }
    }
}
