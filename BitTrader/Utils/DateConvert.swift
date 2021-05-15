//
//  DateConvert.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 18.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

class DateConvert {
    
    
    func convertDate(dateString: String?)-> String {
        
        if let timeResult = (dateString as NSString?)?.doubleValue {
            let date = Date(timeIntervalSince1970: timeResult)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
            return localDate
        }
        return "no date"
    }
}
