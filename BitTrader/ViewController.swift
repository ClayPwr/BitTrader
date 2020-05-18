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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

//        dataFetcherService.fetchOrderBook { (orderBook) in
//            print(orderBook)
//        }
        dataFetcherService.ticker { (ticker) in
            let getDateString = ticker?.timestamp
            let date = self.dateConvert.convertDate(dateString: getDateString)
            print(date)
        }
    }
}

