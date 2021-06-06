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
    
    var id = UUID()
    let pair: BSTradingPair
    let cryptocurrency: CryptoCurrencyCost
    
    var getPrice: String {
        String(Int((Double(self.cryptocurrency.data?.ohlc?.last?.close ?? "") ?? 0).rounded()))
    }
    
    var getDifferenceInPrice: String {
        let open = Int((Double(self.cryptocurrency.data?.ohlc?.last?.open ?? "") ?? 0).rounded())
        let close = Int((Double(self.cryptocurrency.data?.ohlc?.last?.close ?? "") ?? 0).rounded())
        return open > close ? String("+\(open - close)") : String("\(open - close)")
    }
    
    var getMovePrice: Bool {
        //green color if true
        let open = Int((Double(self.cryptocurrency.data?.ohlc?.last?.open ?? "") ?? 0).rounded())
        let close = Int((Double(self.cryptocurrency.data?.ohlc?.last?.close ?? "") ?? 0).rounded())
        return open > close ? true : false
    }
    
    var getData: [Double] {
        var data = [Double]()
        for ohlc in self.cryptocurrency.data?.ohlc ?? [] {
            var open = (ohlc.open ?? "")
            open.remove(at: open.startIndex)
            data.append((Double(open) ?? 0).rounded())
        }
        return data
    }
    
    
    static func getMockPairCostItems() -> [PairCostItem] {
        let traidintPair1 = BSTradingPair(base_decimals: 8, minimum_order: "20.0 USD", name: "BTC/USD", counter_decimals: 2, trading: "Enabled", url_symbol: "btcusd", description: "Bitcoin / U.S. dollar")
        let traidintPair2 = BSTradingPair(base_decimals: 8, minimum_order: "20.0 EUR", name: "BTC/EUR", counter_decimals: 2, trading: "Enabled", url_symbol: "btceur", description: "Bitcoin / Euro")
        let traidintPair3 = BSTradingPair(base_decimals: 8, minimum_order: "20.0 EUR", name: "BTC/GBP", counter_decimals: 2, trading: "Enabled", url_symbol: "btcgbp", description: "Bitcoin / British Pound")
        
        let dataCurrency1 = DataCurrency(pair: "BTC/USD", ohlc: getOHLCitems())
        let cryptocurrency1 = CryptoCurrencyCost(data: dataCurrency1)
        let dataCurrency2 = DataCurrency(pair: "BTC/EUR", ohlc: getOHLCitems())
        let cryptocurrency2 = CryptoCurrencyCost(data: dataCurrency2)
        let dataCurrency3 = DataCurrency(pair: "BTC/GBP", ohlc: getOHLCitems())
        let cryptocurrency3 = CryptoCurrencyCost(data: dataCurrency3)
        
        let model1 = PairCostItem(pair: traidintPair1, cryptocurrency: cryptocurrency1)
        let model2 = PairCostItem(pair: traidintPair2, cryptocurrency: cryptocurrency2)
        let model3 = PairCostItem(pair: traidintPair3, cryptocurrency: cryptocurrency3)
        
        return[model1,model2,model3]
    }
    
    private static func getOHLCitems() -> [OHLC] {
        return[
            OHLC(high: "100", timestamp: "20", volume: "100", low: "100", close: "100", open: "100"),
            OHLC(high: "200", timestamp: "40", volume: "200", low: "200", close: "200", open: "200"),
            OHLC(high: "300", timestamp: "60", volume: "300", low: "300", close: "300", open: "300"),
            OHLC(high: "400", timestamp: "80", volume: "400", low: "400", close: "400", open: "400"),
            OHLC(high: "500", timestamp: "120", volume: "500", low: "500", close: "500", open: "500")
        ]
        
    }
}


