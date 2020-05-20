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


protocol ExchangeProvider {

    // Trading Pairs
    func getTradingPairs(completion: @escaping BSTradingPairResult) -> Void
    
    // Ticker info per Trading Pair:
    func getTicker(for pair: BSTradingPair, completion: @escaping BSTickerResult) -> Void
}
