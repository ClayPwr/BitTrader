//
//  TradingPairListModel.swift
//  BitTrader
//
//  Created by user on 19.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

class TradingPairListModel {
    
    var exchangeTitle: String  = "Bitstamp"
    
    var currency: String {
        return pair.name
    }
    
    var currentValue: String {
        return ticker.last
    }
    
    var percentValue: String {
        return String(ticker.calculatedPercentage())
    }
    
    
    private var pair: BSTradingPair
    private var ticker: BSTicker
    
    public init(pair: BSTradingPair, ticker: BSTicker) {
        self.pair = pair
        self.ticker = ticker
    }
}
