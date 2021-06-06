//
//  TradingPairsTableViewCell.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 20.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import UIKit
import Charts

class TradingPairsTableViewCell: UITableViewCell, TradingPairListModelDelegate {

    @IBOutlet weak var exchangeLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var percentValueLabel: UILabel!
    @IBOutlet weak var percentView: UIView!
    @IBOutlet weak var lineChartView: LineChartView!
    
    var model: TradingPairListModel!
    
    func configure(from pair: TradingPairListModel) {
        self.model = pair
        pair.delegate = self
        
        exchangeLabel.text = pair.exchangeTitle
        currencyLabel.text = pair.currency
        currentValueLabel.text = pair.currentValue
        percentValueLabel.text = pair.percentValue
        percentView.backgroundColor = self.choiseColorForView(percentage: pair.rawPercentage)
        
        pair.theClosure = { transactions in
            var transactionsValues = [ChartDataEntry]()
            for transaction in transactions.reversed() {
                if let date = Double(transaction.date), let price = Double(transaction.price) {
                    let value = ChartDataEntry(x: date, y: price)
                    transactionsValues.append(value)

                }
            }
            self.setData(transactionsValues)
        }
        model.getTransactionData(pairList: model)
        
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
    
    func didUpdateTransactionsHistory(_ history: [ChartDataEntry]) {
        self.setData(history)
    }
}

extension TradingPairsTableViewCell {
    
   private func setData(_ transactionData: [ChartDataEntry]) {
        customizelineChartView()
        let set1 = LineChartDataSet(entries: transactionData, label: "Detail")

        set1.drawCirclesEnabled = false
        set1.mode = .cubicBezier
        set1.lineWidth = 3
        set1.setColor(.clear)
        set1.fill = Fill(color: .systemGreen)
        set1.fillAlpha = 0.7
        set1.drawFilledEnabled = true
        set1.drawHorizontalHighlightIndicatorEnabled = false
        
        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
        lineChartView.data = data
        
    }

    
    private func customizelineChartView(){
        lineChartView.backgroundColor = .black
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.enabled = false
        lineChartView.xAxis.enabled = false
        lineChartView.contentMode = .scaleAspectFill
        lineChartView.drawGridBackgroundEnabled = false
        

        lineChartView.animate(xAxisDuration: 1.5)
    }
}
