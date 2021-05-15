//
//  Date+TIme.swift
//  BitTrader
//
//  Created by user on 26.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

extension Date {
    
    static func dateFromTimestamp(tmstp: Double) -> Date {
        //
        //
        //
        return Date()
    }
    
    func getHours() -> Double {
        //
        //
        return 0.0
    }
    
    func getMinutes() -> Double {
        //
        //
        return 0.0
    }
}

extension TimeInterval {
    func getMinutes() -> Double {
        return Double(Int(self) / 60 % 60)
    }
    
    func getHours() -> Double {
        return Double(Int(self) / 3600)
    }
    
    //convert unix time to date and time
    func getMin() -> Double {
        let currentDate = Date()
        let epochDate = Date(timeIntervalSince1970: self)
        
        let calendar = Calendar.current
        let currentMinutes = calendar.component(.minute, from: currentDate)
        
        let epochMinute = calendar.component(.minute, from: epochDate)
        
        if (currentMinutes - epochMinute <= 1) {
            return Double(currentMinutes - epochMinute)
        }
        return Double(epochMinute)
    }
}
