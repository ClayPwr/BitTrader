//
//  CryptocurrencySmallItemsView.swift
//  BitTraderWidgetExtensionExtension
//
//  Created by User on 5/18/21.
//  Copyright © 2021 Tarabanov Igor. All rights reserved.
//

import SwiftUI
import WidgetKit

struct CryptocurrencySmallItemsView: View {
    var list: [PairCostItem]
    var visibleItems: Int
    
    @ViewBuilder
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(list.prefix(visibleItems), id: \.self) { model in
                CryptocurrencySmallRow(model: model)
            }
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}

struct CryptocurrencySmallItemsView_Previews: PreviewProvider {
    static var previews: some View {
        CryptocurrencySmallItemsView(list: PairCostItem.getMockPairCostItems(), visibleItems: 3)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
