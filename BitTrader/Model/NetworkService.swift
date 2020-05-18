//
//  NetworkService.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 18.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation
import Alamofire


class NetworkService {
    
    func request(urlString: String, completion: @escaping (AFDataResponse<Any>)-> Void) {
        AF.request(urlString)
            .validate(statusCode: 200..<300)
            .responseJSON(completionHandler: completion)
    }
    
    func requestWithParams(urlString: String, completion: @escaping (AFDataResponse<Any>)-> Void){
        
        let urlParams = [
                   "group":"2",
               ]
        
        AF.request(urlString, method: .get, parameters: urlParams, headers: nil)
            .validate(statusCode: 200..<300)
        .responseJSON(completionHandler: completion)
    }
}
