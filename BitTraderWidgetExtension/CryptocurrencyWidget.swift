//
//  CryptocurrencyWidget.swift
//  BitTraderWidgetExtensionExtension
//
//  Created by User on 5/16/21.
//  Copyright © 2021 Tarabanov Igor. All rights reserved.
//

import WidgetKit
import SwiftUI

typealias PairEntryResult = (PairCryptocurrencyEntry?) -> (Void)

struct PairCryptocurrencyEntry: TimelineEntry {
    let date: Date
    var list: [PairCostItem]
}

struct CryptocurrencyProvider: TimelineProvider {
    @State var isLoading = false
    
    func placeholder(in context: Context) -> PairCryptocurrencyEntry {
        return PairCryptocurrencyEntry(date: Date(), list: PairCostItem.getMockPairCostItems())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (PairCryptocurrencyEntry) -> Void) {
        let entry = PairCryptocurrencyEntry(date: Date(), list: PairCostItem.getMockPairCostItems())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<PairCryptocurrencyEntry>) -> Void) {
        
         getData { (entry) -> (Void) in
            if let entry = entry {
                let currentDate = Date()
                let refreshDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
                let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
                completion(timeline)
            } else {
                let entry = PairCryptocurrencyEntry(date: Date(), list: PairCostItem.getMockPairCostItems())
                let currentDate = Date()
                let refreshDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
                let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
                completion(timeline)
            }
        }
        
        
    }
    
    private func getData(completion: @escaping PairEntryResult) {
        getPairs(completion: completion)
    }
    
    func getPairs(completion: @escaping PairEntryResult) {
        let serviceBitstampExcProv = Services.all.bitstampExchangeProvider
        serviceBitstampExcProv.getTradingPairs { (pairs, error)  in
            guard let pairs = pairs else { return }
            getCurrency(pairs: pairs, completion: completion)
        }
    }
    
    func getCurrency(pairs: [BSTradingPair], completion: @escaping PairEntryResult) {
        let serviceBitstampExcProv = Services.all.bitstampExchangeProvider
        var currencyGlobal = [CryptoCurrencyCost]()
        var pairCostItems = [PairCostItem]()
        let group = DispatchGroup()
        for pair in pairs.prefix(6) {
            group.enter()
            serviceBitstampExcProv.getCryptoCurrencyCost(for: pair) { (currency, error) in
                guard let currency = currency else { return }
                currencyGlobal.append(currency)
                group.leave()
            }
        }
        group.notify(queue: .main) {
            for pair in pairs {
                let currency = currencyGlobal.first(where: { $0.data?.pair == pair.name })
                if let currency = currency {
                    pairCostItems.append(PairCostItem(pair: pair, cryptocurrency: currency))
                }
            }
            completion(PairCryptocurrencyEntry(date: Date(), list: pairCostItems))
        }
    }
}

struct CryptocurrencyWidget: Widget {
    let kind: String = "CryptocurrencyWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CryptocurrencyProvider()) { (entry) in
            CryptocurrencyView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct CryptocurrencyWidget_Previews: PreviewProvider {
    static var previews: some View {
        CryptocurrencyView(entry: PairCryptocurrencyEntry(date: Date(), list: PairCostItem.getMockPairCostItems()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
