//
//  TradingPairsTableViewCell.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 20.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import UIKit

class TradingPairsTableViewCell: UITableViewCell {

    @IBOutlet weak var exchangeLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var percentValueLabel: UILabel!
    @IBOutlet weak var percentView: UIView!
    
    func configure(from pair: TradingPairListModel) {
        
        exchangeLabel.text = pair.exchangeTitle
        currencyLabel.text = pair.currency
        currentValueLabel.text = pair.currentValue
        percentValueLabel.text = pair.percentValue
        percentView.backgroundColor = pair.choiseColorForView()
    }
}
