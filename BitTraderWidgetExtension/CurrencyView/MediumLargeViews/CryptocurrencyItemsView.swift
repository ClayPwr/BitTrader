//
//  CryptocurrencyItemsView.swift
//  BitTraderWidgetExtensionExtension
//
//  Created by User on 5/20/21.
//  Copyright © 2021 Tarabanov Igor. All rights reserved.
//

import SwiftUI
import WidgetKit

struct CryptocurrencyItemsView: View {
    var list: [PairCostItem]
    var visibleItems: Int
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ForEach(list.prefix(visibleItems), id: \.self) { model in
                CryptocurrencyRow(model: model)
            }
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}

struct CryptocurrencyItemsView_Previews: PreviewProvider {
    static var previews: some View {
        CryptocurrencyItemsView(list: PairCostItem.getMockPairCostItems(), visibleItems: 3)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
