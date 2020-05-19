//
//  OrderBook.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 18.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

struct BSOrderBook: Decodable {
    
    let timestamp: String
    let microtimestamp: String
    let bids: [[String]]
    let asks: [[String]]
}

