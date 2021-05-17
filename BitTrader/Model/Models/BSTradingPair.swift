//
//  TradingPairInfo.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 18.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

struct BSTradingPair: Codable {
    
    let base_decimals: Int
    let minimum_order: String
    let name: String
    let counter_decimals: Int
    let trading: String
    let url_symbol: String
    let description: String

}
