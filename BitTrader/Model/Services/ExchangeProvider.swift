//
//  ExchangeProvider.swift
//  BitTrader
//
//  Created by user on 19.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

typealias BSTradingPairResult = ([BSTradingPair]?, Error?) -> (Void)
typealias BSTickerResult = (BSTicker?, Error?) -> (Void)
typealias BSTransactionResult = ([BSTransactionsHistory]?, Error?) -> Void
typealias BSCryptoCurrencyResult = (CryptoCurrencyCost?, Error?) -> Void


protocol ExchangeProvider {

    // Trading Pairs
    func getTradingPairs(completion: @escaping BSTradingPairResult) -> Void
    
    // Ticker info per Trading Pair:
    func getTicker(for pair: BSTradingPair, completion: @escaping BSTickerResult) -> Void
    
    // Transactions:
    func getTransactions(for pair: BSTradingPair, completion: @escaping BSTransactionResult) -> Void
    
    //Cost cryptocurrency
    func getCryptoCurrencyCost(for pair: BSTradingPair, completion: @escaping BSCryptoCurrencyResult)
}
