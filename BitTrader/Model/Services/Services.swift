//
//  Services.swift
//  BitTrader
//
//  Created by user on 19.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation


class Services {

    let bitstampExchangeProvider: ExchangeProvider
    let dateConvert: DateConvert
    private init() {
        self.dateConvert = DateConvert()
        self.bitstampExchangeProvider = BitstampExchangeProvider()
    }
    
    static let all = Services()
}
