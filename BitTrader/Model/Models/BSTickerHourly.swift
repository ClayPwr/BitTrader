//
//  BSTickerHourly.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 19.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation


struct BSTickerHourly: Decodable {
    
    //Last 24 hours price high.
    let high: String
    //Last BTC price.
    let last: String
    //Unix timestamp date and time.
    let timestamp: String
    //Highest buy order.
    let bid: String
    //Last 24 hours volume weighted average price.
    let vwap: String
    //Last 24 hours volume.
    let volume: String
    //Last 24 hours price low.
    let low: String
    //Lowest sell order.
    let ask: String
    //First price of the day.
    let open: Double
}
