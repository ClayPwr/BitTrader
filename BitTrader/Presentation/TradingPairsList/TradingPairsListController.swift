//
//  TradingPairsListController.swift
//  BitTrader
//
//  Created by user on 19.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import UIKit

class TradingPairsListController: UIViewController {

    var exchangeProvider: ExchangeProvider!
    
    var rows: [TradingPairListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        self.exchangeProvider.getTradingPairs { (pairs, error) -> (Void) in
            if let pairs = pairs {
                
                for pair in pairs {
                    self.exchangeProvider.getTicker(for: pair) { (ticker, error) -> (Void) in
                        
                        if let ticker = ticker {
                            let row =  TradingPairListModel(pair: pair, ticker: ticker)
                            self.rows.append(row)
                        }
                        
                        //
//                        self.tableView.reloadData()
                    }
                }
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
