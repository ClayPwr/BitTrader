//
//  PairTransaction.swift
//  BitTraderWidgetExtensionExtension
//
//  Created by User on 5/16/21.
//  Copyright © 2021 Tarabanov Igor. All rights reserved.
//

import Foundation

struct PairTransaction: Codable {
    let date: Date
    let list: [Pair]
}

struct Pair: Codable {
    let tradingPair: BSTradingPair
    let transactionsForCharts: String
}
