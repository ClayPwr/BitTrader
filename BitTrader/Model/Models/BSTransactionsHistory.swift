//
//  Transaction.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 18.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

struct BSTransactionsHistory: Decodable {
    
    let date: String
    let tid: String
    let price: String
    let type: String
    let amount: String
}
