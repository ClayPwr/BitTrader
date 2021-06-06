//
//  DataFetcherService.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 18.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation
import Alamofire

class DataFetcherService {
    let transactions = "https://www.bitstamp.net/api/v2/transactions/"
    let orderBookUrl = "https://www.bitstamp.net/api/order_book/"
    let tradingPairInfo = "https://www.bitstamp.net/api/v2/trading-pairs-info/"
    let conversionRate = "https://www.bitstamp.net/api/eur_usd/"
    let hourlyUrlString = "https://www.bitstamp.net/api/ticker_hour/"
    let tickerUrl = "https://www.bitstamp.net/api/v2/ticker/"
    let cryptocurrencyCost = "https://www.bitstamp.net/api/v2/ohlc/"
    
    
    //var partOfUrl = "btceur"
    
    let networkDataFetcher = NetworkDataFetcher()
    
    
    func fetchTransactions(partOfUrl: String, completion: @escaping ([BSTransactionsHistory]?)-> Void){
        
        let validUrl = transactions.appending(partOfUrl) + "/"
        
        networkDataFetcher.fetchGenericJSONData(urlString: validUrl, responseDecoded: completion)
    }
    
    func fetchOrderBook(completion: @escaping (BSOrderBook?)-> Void){
        networkDataFetcher.fetchGenericJSONData(urlString: orderBookUrl, responseDecoded: completion)
    }
    
    func tradePairInfo(completion: @escaping ([BSTradingPair]?) -> Void){
        networkDataFetcher.fetchGenericJSONData(urlString: tradingPairInfo, responseDecoded: completion)
    }
    
    func conversionRateUseEur(completion: @escaping (ConversionRateEurUsd?) -> Void){
        networkDataFetcher.fetchGenericJSONData(urlString: conversionRate, responseDecoded: completion)
    }
    
    func hourlyTicker(completion: @escaping (BSTickerHourly?) -> Void){
        networkDataFetcher.fetchGenericJSONData(urlString: hourlyUrlString, responseDecoded: completion)
    }
    
    func ticker(partOfUrl: String, completion: @escaping (BSTicker?) -> Void){
        
        let validUrl = tickerUrl.appending(partOfUrl) + "/"

        networkDataFetcher.fetchGenericJSONData(urlString: validUrl, responseDecoded: completion)
    }
    
    func cryptoCurrencyCost(partOfUrl: String, completion: @escaping (CryptoCurrencyCost?) -> Void) {
        
        let validUrl = cryptocurrencyCost.appending(partOfUrl) + "/"
        
        networkDataFetcher.fetchGenericJSONDataParams(urlString: validUrl, responseDecoded: completion)
    }
    
}
