//
//  CryptocurrencyItemsView.swift
//  BitTraderWidgetExtensionExtension
//
//  Created by User on 5/18/21.
//  Copyright © 2021 Tarabanov Igor. All rights reserved.
//

import SwiftUI
import WidgetKit

struct CryptocurrencyListView: View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var list: [PairCostItem]
    
    @ViewBuilder
    var body: some View {
        VStack(alignment: .leading, spacing: 0)/* content:)*/ {
            switch family {
            case .systemSmall:
                CryptocurrencySmallItemsView(list: list, visibleItems: 3)
            case .systemMedium:
                CryptocurrencyItemsView(list: list, visibleItems: 3)
            case .systemLarge:
                CryptocurrencyItemsView(list: list, visibleItems: 6)
            default:
                CryptocurrencySmallItemsView(list: list, visibleItems: 3)
            }
        }
    }
}

struct CryptocurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptocurrencyListView(list: PairCostItem.getMockPairCostItems())
        .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
