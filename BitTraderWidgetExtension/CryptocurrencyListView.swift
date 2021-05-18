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
                Text("fds")
            case .systemLarge:
                Text("fds")
            default:
                Text("fds")
            }
        }
    }
}

struct CryptocurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptocurrencyListView(list: PairCostItem.getMockPairCostItems())
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
