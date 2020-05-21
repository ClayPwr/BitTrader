//
//  TradingPairsTableViewCell.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 20.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import UIKit

class TradingPairsTableViewCell: UITableViewCell, TradingPairListModelDelegate {

    @IBOutlet weak var exchangeLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var percentValueLabel: UILabel!
    @IBOutlet weak var percentView: UIView!
    
    var model: TradingPairListModel!
    
    func configure(from pair: TradingPairListModel) {
        self.model = pair
        pair.delegate = self
        
        exchangeLabel.text = pair.exchangeTitle
        currencyLabel.text = pair.currency
        currentValueLabel.text = pair.currentValue
        percentValueLabel.text = pair.percentValue
        percentView.backgroundColor = self.choiseColorForView(percentage: pair.rawPercentage)
    }
    
    //
    func choiseColorForView(percentage: Double) -> UIColor {
        return percentage > 0 ? .green : .red
    }
    
    // MARK: - TradingPairListModelDelegate
    
    func tickerDidChange(_ ticker: BSTicker) {
        currentValueLabel.text = self.model.currentValue
        percentValueLabel.text = self.model.percentValue
        percentView.backgroundColor = self.choiseColorForView(percentage: self.model.rawPercentage)
    }
}
