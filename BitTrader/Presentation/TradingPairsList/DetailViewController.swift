//
//  DetailViewController.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 21.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import UIKit
import Charts

class DetailViewController: UIViewController {
    
    var tradingPairListModel: TradingPairListModel!
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    //var numbers = [Double]()
    var transactionData = [ChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setData()
    }
    
    func setData() {
        customizelineChartView()
        let set1 = LineChartDataSet(entries: transactionData, label: "Detail")

        set1.drawCirclesEnabled = false
        set1.mode = .cubicBezier
        set1.lineWidth = 3
        set1.setColor(.systemGreen)
        set1.fill = Fill(color: .systemGreen)
        set1.fillAlpha = 0.7
        set1.drawFilledEnabled = true
        set1.drawHorizontalHighlightIndicatorEnabled = false
        
        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
        lineChartView.data = data
        
    }

    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 1.0),
    ChartDataEntry(x: 3.0, y: 2.0),
    ChartDataEntry(x: 5.0, y: 7.0),
    ChartDataEntry(x: 8.0, y: 9.0),
    ChartDataEntry(x: 12.0, y: 13.0),
    ChartDataEntry(x: 15.0, y: 18.0)]
    
    private func customizelineChartView(){
        lineChartView.backgroundColor = .black
        lineChartView.rightAxis.enabled = false
        lineChartView.contentMode = .scaleAspectFill
        lineChartView.drawGridBackgroundEnabled = false
        
        let yAxis = lineChartView.leftAxis
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .black
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelPosition = .outsideChart
        //добавляет сетку
        yAxis.gridColor = .clear
        
        let xAxis = lineChartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .boldSystemFont(ofSize: 12)
        xAxis.labelTextColor = .white
        xAxis.setLabelCount(6, force: false)
        xAxis.axisLineColor = .systemGreen
        //добавляет сутку по X
        xAxis.gridColor = .clear

        lineChartView.animate(xAxisDuration: 2.5)
    }
}
