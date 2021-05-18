//
//  BSCostOHLC.swift
//  BitTrader
//
//  Created by User on 5/17/21.
//  Copyright © 2021 Tarabanov Igor. All rights reserved.
//

import Foundation

struct CryptoCurrencyCost: Codable {
    var data: DataCurrency?
}

struct DataCurrency: Codable {
    var pair: String?
    var ohlc: [OHLC]?
}

struct OHLC: Codable {
    var high: String?
    var timestamp: String?
    var volume: String?
    var low: String?
    var close: String?
    var open: String?
}
