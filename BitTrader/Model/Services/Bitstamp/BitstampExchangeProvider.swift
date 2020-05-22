//
//  BitstampExchangeProvider.swift
//  BitTrader
//
//  Created by user on 19.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

class BitstampExchangeProvider: ExchangeProvider{

    
    let dataFetcher = DataFetcherService()
    
    func getTradingPairs(completion: @escaping ([BSTradingPair]?, Error?) -> (Void)) {
        dataFetcher.tradePairInfo { (pairs) in
            //нужны ли такие двойные проверки? такаяже проверка в контролере
            if let pairses = pairs {
                completion(pairses, nil)
            }else{
                
                print("BitstampExchangeProvider got nil at getTradingPairs")
                completion(nil, nil)
            }
        }
    }
    
    func getTicker(for pair: BSTradingPair, completion: @escaping (BSTicker?, Error?) -> (Void)) {
        dataFetcher.ticker(partOfUrl: pair.url_symbol) { (ticker) in
            if let tickere = ticker {
                completion(tickere, nil)
            }else{
                
                print("BitstampExchangeProvider got nil at getTicker")
                completion(nil, nil)
            }
        }
    }
    
    func getTransactions(for pair: BSTradingPair, completion: @escaping BSTransactionResult) {
        
        dataFetcher.fetchTransactions(partOfUrl: pair.url_symbol) { (transactions) in
            if let transactions = transactions {
                completion(transactions, nil)
            }else{
                print("BitstampExchangeProvider got nil at getTransactions")
                completion(nil, nil)
            }
        }
    }
}
