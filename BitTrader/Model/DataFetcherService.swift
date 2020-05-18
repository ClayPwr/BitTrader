//
//  DataFetcherService.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 18.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

class DataFetcherService{
    let transactions = "https://www.bitstamp.net/api/transactions/"
    let orderBookUrl = "https://www.bitstamp.net/api/order_book/"
    let tradingPairInfo = "https://www.bitstamp.net/api/v2/trading-pairs-info/"
    let conversionRate = "https://www.bitstamp.net/api/eur_usd/"
    let hourlyUrlString = "https://www.bitstamp.net/api/ticker_hour/"
    let tickerUrl = "https://www.bitstamp.net/api/ticker/"
    
    let networkDataFetcher = NetworkDataFetcher()
    
    //надо что-то сделать с массивом
    func fetchTransactions(completion: @escaping (Transaction?)-> Void){
        networkDataFetcher.fetchGenericJSONData(urlString: transactions, responseDecoded: completion)
    }
    
    func fetchOrderBook(completion: @escaping (OrderBook?)-> Void){
        networkDataFetcher.fetchGenericJSONData(urlString: orderBookUrl, responseDecoded: completion)
    }
    
    func tradePairInfo(completion: @escaping (TradingPairInfo?) -> Void){
        networkDataFetcher.fetchGenericJSONData(urlString: tradingPairInfo, responseDecoded: completion)
    }
    
    func conversionRateUseEur(completion: @escaping (ConversionRateEurUsd?) -> Void){
        networkDataFetcher.fetchGenericJSONData(urlString: conversionRate, responseDecoded: completion)
    }
    
    func hourlyTicker(completion: @escaping (Ticker?) -> Void){
        networkDataFetcher.fetchGenericJSONData(urlString: hourlyUrlString, responseDecoded: completion)
    }
    
    func ticker(completion: @escaping (Ticker?) -> Void){
        networkDataFetcher.fetchGenericJSONData(urlString: tickerUrl, responseDecoded: completion)
    }
}
