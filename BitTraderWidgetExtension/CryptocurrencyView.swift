//
//  CryptocurrencyView.swift
//  BitTraderWidgetExtensionExtension
//
//  Created by User on 5/17/21.
//  Copyright © 2021 Tarabanov Igor. All rights reserved.
//

import SwiftUI
import WidgetKit

struct CryptocurrencyView: View {
    var entry: PairCryptocurrencyEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            CryptocurrencyListView(list: entry.list)
            
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .leading)
        .background(Color.black)
    }
}

struct CryptocurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CryptocurrencyView(entry: PairCryptocurrencyEntry(date: Date(), list: PairCostItem.getMockPairCostItems()))
        .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
