//
//  TradingPairsListController.swift
//  BitTrader
//
//  Created by user on 19.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import UIKit

class TradingPairsListController: UIViewController {
    //как правильно инициализировать exchangeProvider?
    //var exchangeProvider: ExchangeProvider!
    //let exchangeProvider = BitstampExchangeProvider()
    let serviceBitstampExcProv = Services.all.bitstampExchangeProvider
    
    var rows: [TradingPairListModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serviceBitstampExcProv.getTradingPairs { (pairs, error) -> (Void) in
            guard let pairs = pairs else { return }
            
            let rows = pairs.map({ TradingPairListModel(pair: $0, exchangeProvider: self.serviceBitstampExcProv) })
            self.rows = rows
            self.tableView.reloadData()
        }
    }
}

extension TradingPairsListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TradingPairsTableViewCell
        
        cell.configure(from: rows[indexPath.row])
        
        return cell
    }
    //если убрать метод то выдает constrait ошибок
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
