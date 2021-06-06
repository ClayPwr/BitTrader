//
//  CryptocurrencyRow.swift
//  BitTraderWidgetExtensionExtension
//
//  Created by User on 5/20/21.
//  Copyright © 2021 Tarabanov Igor. All rights reserved.
//

import SwiftUI
import WidgetKit
import Charts
import SwiftUICharts

struct CryptocurrencyRow: View {
    var model: PairCostItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.pair.name)
                    .font(.custom("SF Pro Display", size: 16))
                    .foregroundColor(.white)
                Text(model.pair.description)
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
            }
            Spacer()
            drawChart(chartData: model.getData)
                .padding(.trailing, 0)
            VStack {
                Text(model.getPrice)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                Text(model.getDifferenceInPrice)
                    .foregroundColor(model.getMovePrice ? .green : .red)
                    .font(.system(size: 12))
            }
        }.background(Color.black)
    }
    
    func drawChart(chartData: [Double]) -> some View {
        let grad = model.getMovePrice ?
            ColorGradient(Color.green, Color.green) :
            ColorGradient(Color.red, Color.red)
        return             CardView(showShadow: false) {
                            LineChart()
                        }
                        .data(chartData)
                        .chartStyle(.init(backgroundColor: Color.green, foregroundColor: grad))
        .frame(width: 100, height: 45)
        .offset(y: -12)
    }

}

//struct ChartView: UIViewRepresentable {
//    var lineChartView = LineChartView()
//
////    @Binding var text: NSMutableAttributedString
//    @Binding var chartsData: [OHLC]
//
//    func makeUIView(context: Context) -> LineChartView {
//            lineChartView
//        }
//
//    func updateUIView(_ uiView: LineChartView, context: Context) {
//        //            uiView.attributedText = text
//
//        var transactionsValues = [ChartDataEntry]()
////        for data in chartsData {
////
////            transactionsValues.append(ChartDataEntry(x: Double(data.high ?? "") ?? 0, y: Double(data.timestamp ?? "") ?? 0))
////        }
//        for i in 0...10 {
//            transactionsValues.append(ChartDataEntry(x: Double(i) * 10, y: Double(i)))
//        }
//        let set1 = LineChartDataSet(entries: transactionsValues, label: "DetailWidget")
//        let data = LineChartData(dataSet: set1)
//        lineChartView.data = data
////        setData(transactionsValues)
//    }
//
//    private func setData(_ transactionData: [ChartDataEntry]) {
//         customizelineChartView()
//         let set1 = LineChartDataSet(entries: transactionData, label: "DetailWidget")
//
//         set1.drawCirclesEnabled = false
//         set1.mode = .cubicBezier
//         set1.lineWidth = 3
//         set1.setColor(.clear)
//         set1.fill = Fill(color: .systemGreen)
//         set1.fillAlpha = 0.7
//         set1.drawFilledEnabled = true
//         set1.drawHorizontalHighlightIndicatorEnabled = false
//
//         let data = LineChartData(dataSet: set1)
//         data.setDrawValues(false)
//         lineChartView.data = data
//
//     }
//
//
//     private func customizelineChartView(){
//         lineChartView.backgroundColor = .black
//         lineChartView.rightAxis.enabled = false
//         lineChartView.leftAxis.enabled = false
//         lineChartView.xAxis.enabled = false
//         lineChartView.contentMode = .scaleAspectFill
//         lineChartView.drawGridBackgroundEnabled = false
//
//
//         lineChartView.animate(xAxisDuration: 1.5)
//     }
//
//}

//struct ContentView: View {
//    @State var chartsData: [OHLC]
//    
//    var body: some View {
//        ChartView(chartsData: $chartsData)
//            .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 30)
//    }
//}

struct CryptocurrencyRow_Previews: PreviewProvider {
    static var previews: some View {
        CryptocurrencyRow(model: PairCostItem.getMockPairCostItems()[0])
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
