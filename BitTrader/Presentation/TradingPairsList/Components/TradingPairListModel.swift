//
//  TradingPairListModel.swift
//  BitTrader
//
//  Created by user on 19.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation
import UIKit

class TradingPairListModel {
    
    var exchangeTitle: String  = "Bitstamp"
    
    var currency: String {
        return pair.name
    }
    
    var currentValue: String {
        return ticker.roundedNumber()
    }
    
    var percentValue: String {
        return String(ticker.calculatedPercentage()) + " %"
    }
    
    var urlSymbol: String {
        return pair.url_symbol
    }
    
    
    private var pair: BSTradingPair
    private var ticker: BSTicker
    
    public init(pair: BSTradingPair, ticker: BSTicker) {
        self.pair = pair
        self.ticker = ticker
    }
    
    //Где нужно было размещать данный метод? чтоб не импортировать сюда UIKit
    func choiseColorForView() -> UIColor {
        let percent = ticker.calculatedPercentage()
        if percent > 0 {
            return UIColor.green
        }else {
            return UIColor.red
        }
    }
}
