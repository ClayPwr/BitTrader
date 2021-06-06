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
                    .font(.custom("SF Pro Display", size: 16))
                    .foregroundColor(.white)
                Text(model.pair.description)
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
            }
            Spacer()
            VStack {
                Text(model.getPrice)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                Text(model.getDifferenceInPrice)
                    .foregroundColor(model.getMovePrice ? .green : .red)
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
