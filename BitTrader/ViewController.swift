//
//  ViewController.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 05.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    let dataFetcherService = DataFetcherService()
    let dateConvert = DateConvert()
    
  // let exchangeProvider: ExchangeProvider = Services.all.bitstampExchangeProvider
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.exchangeProvider.getTradingPairs { (pairs, error) -> (Void) in
//            
//            if let pairs = pairs {
//                
//            }
//        }
        
//        Services.all.bitstampExchangeProvider
        

//        dataFetcherService.fetchOrderBook { (orderBook) in
//            print(orderBook)
//        }
//        dataFetcherService.ticker { (ticker) in
//            let getDateString = ticker?.timestamp
//            let date = self.dateConvert.convertDate(dateString: getDateString)
//            print(date)
//        }
    }
}

