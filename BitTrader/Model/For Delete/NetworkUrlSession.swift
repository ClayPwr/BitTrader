//
//  NetworkUrlSession.swift
//  BitTrader
//
//  Created by Tarabanov Igor on 18.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

class NetworkUrlSession {
    
    private init(){}
    static let shared = NetworkUrlSession()
    
    func fetchData(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let json = try decoder.decode(Ticker.self, from: data)
                print(json)
            }catch let error as NSError{
                print(error)
            }
        }
        dataTask.resume()
    }
}
