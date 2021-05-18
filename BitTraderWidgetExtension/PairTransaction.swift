//
//  PairTransaction.swift
//  BitTraderWidgetExtensionExtension
//
//  Created by User on 5/16/21.
//  Copyright © 2021 Tarabanov Igor. All rights reserved.
//

import Foundation

struct PairCostItem: Hashable {
    static func == (lhs: PairCostItem, rhs: PairCostItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    var id: Int = -1
    let pair: BSTradingPair
    let cryptocurrency: CryptoCurrencyCost
    
    
    
    static func getMockPairCostItems() -> [PairCostItem] {
        let traidintPair1 = BSTradingPair(base_decimals: 8, minimum_order: "20.0 USD", name: "BTC/USD", counter_decimals: 2, trading: "Enabled", url_symbol: "btcusd", description: "Bitcoin / U.S. dollar")
        let traidintPair2 = BSTradingPair(base_decimals: 8, minimum_order: "20.0 EUR", name: "BTC/EUR", counter_decimals: 2, trading: "Enabled", url_symbol: "btceur", description: "Bitcoin / Euro")
        let traidintPair3 = BSTradingPair(base_decimals: 8, minimum_order: "20.0 EUR", name: "BTC/GBP", counter_decimals: 2, trading: "Enabled", url_symbol: "btcgbp", description: "Bitcoin / British Pound")
        
        let dataCurrency1 = DataCurrency(pair: "BTC/USD", ohlc: nil)
        let cryptocurrency1 = CryptoCurrencyCost(data: dataCurrency1)
        let dataCurrency2 = DataCurrency(pair: "BTC/EUR", ohlc: nil)
        let cryptocurrency2 = CryptoCurrencyCost(data: dataCurrency2)
        let dataCurrency3 = DataCurrency(pair: "BTC/GBP", ohlc: nil)
        let cryptocurrency3 = CryptoCurrencyCost(data: dataCurrency3)
        
        let model1 = PairCostItem(pair: traidintPair1, cryptocurrency: cryptocurrency1)
        let model2 = PairCostItem(pair: traidintPair2, cryptocurrency: cryptocurrency2)
        let model3 = PairCostItem(pair: traidintPair3, cryptocurrency: cryptocurrency3)
        
        return[model1,model2,model3]
    }
}

class ServicesItems {
    let serviceBitstampExcProv = Services.all.bitstampExchangeProvider
    
    
}

struct Item: TradingPairListItem {
    var exchangeTitle: String
    
    var currency: String
    
    var currentValue: String
    
    var percentValue: String
    
    var rawPercentage: Double
    
}


