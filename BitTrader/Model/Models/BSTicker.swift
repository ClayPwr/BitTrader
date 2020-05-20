//
//  Ticker.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 18.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

// Bitstamp - BS

struct BSTicker: Decodable{
    
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
    let open: String
    
    
    func calculatedPercentage() -> Double {
        if let lastValue = Double(self.last), let openValue = Double(self.open) {
            //let openValue = Double(self.open)
            let different = openValue - lastValue
            let getNumer = (different / openValue) * 100
            let roundedNumber = Double(round(1000*getNumer)/1000)
            return roundedNumber
        }else{
            return 0.0
        }
    }
    
    func roundedNumber() -> String {
        if let lastPrice = Double(self.last) {
            let roundedNumber = Double(round(1000*lastPrice)/1000)
            let toString = String(roundedNumber)
            return toString
        }else{
            return last
        }
    }
}


