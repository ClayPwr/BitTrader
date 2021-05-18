//
//  CryptocurrencySmallRow.swift
//  BitTraderWidgetExtensionExtension
//
//  Created by User on 5/18/21.
//  Copyright © 2021 Tarabanov Igor. All rights reserved.
//

import SwiftUI
import WidgetKit

struct CryptocurrencySmallRow: View {
    var model: PairCostItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.pair.name)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                Text(model.pair.description)
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
            }
            Spacer()
            VStack {
                Text("\(55140)")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                Text("\(-3294)")
                    .foregroundColor(.red)
                    .font(.system(size: 14))
            }
        }.background(Color.black)
    }
}

struct CryptocurrencySmallRow_Previews: PreviewProvider {
    static var previews: some View {
        CryptocurrencySmallRow(model: PairCostItem.getMockPairCostItems()[0])
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
