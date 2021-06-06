//
//  BitTraderWidgetExtension.swift
//  BitTraderWidgetExtension
//
//  Created by User on 5/16/21.
//  Copyright © 2021 Tarabanov Igor. All rights reserved.
//

import WidgetKit
import SwiftUI

@main
struct BitTraderWidgets: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        CryptocurrencyWidget()
    }
}

