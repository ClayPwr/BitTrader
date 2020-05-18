//
//  NetworkAlamofire.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 18.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation
import Alamofire

class NetworkAlamofire {
    
    func sendRequest3Request(urlString: String) {
        
        // Add URL parameters
        //The group parameter is used for accessing different data from order book. Possible values are 0 (orders are not grouped at same price), 1 (orders are grouped at same price - default) or 2 (orders with their order ids are not grouped at same price).
        let urlParams = [
            "group":"2",
        ]

        
        // Fetch Request
        AF.request(urlString, method: .get, parameters: urlParams, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                if let data = response.data  {
                    debugPrint("HTTP Response Body: \(data)")
                    do{
                        let decoder = JSONDecoder()
                        //let json = try JSONSerialization.jsonObject(with: data, options: [])
                        let json =  try decoder.decode(OrderBook.self, from: data)
                        print(json)
                    }catch let error as NSError {
                        print(error.localizedRecoverySuggestion ?? "cant response")
                    }
                }
                else {
                    debugPrint("HTTP Request failed: \(String(describing: response.error))")
                }
            }
    }
}
