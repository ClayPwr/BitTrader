//
//  Services.swift
//  BitTrader
//
//  Created by user on 19.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation


class Services {

    let bitstampExchangeProvider: ExchangeProvider
    let dateConvert: DateConvert
    
    private init() {
        self.dateConvert = DateConvert()
        self.bitstampExchangeProvider = BitstampExchangeProvider()
    }
    
    static let all = Services()
    
    func getTradingPairListModelItems(closure: @escaping ([TradingPairListModel]?)->()) {
        let group = DispatchGroup()
        var list: [TradingPairListModel]?
        group.enter()
        bitstampExchangeProvider.getTradingPairs { (pairs, error) -> (Void) in
            guard let pairs = pairs else { return }
            list = pairs.map({ TradingPairListModel(pair: $0, exchangeProvider: self.bitstampExchangeProvider) })
            group.leave()
        }
        
        group.notify(queue: .global()) {
            closure(list)
        }
    }
}
