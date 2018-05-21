//
//  DataServices.swift
//  DemoWeatherAPI
//
//  Created by Vu Ngoc Cong on 5/19/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit

class Weather7DaysDataServices {
    
    static let shared: Weather7DaysDataServices = Weather7DaysDataServices()
    
    func getWeatherAPI(complete: @escaping(WeatherFocast)-> Void) {
        let urlString = "https://api.apixu.com/v1/forecast.json?key=9d9034f0faa84cf6b7434134181704&days=7&lang=vi&q=Hanoi"
        guard let url = URL(string: urlString) else {return}
        let urlRequest = URLRequest(url: url)
        
        DispatchQueue.global().async {
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                guard let aData = data else { return }
                
                do {
                    if let results = try JSONSerialization.jsonObject(with: aData, options: .mutableContainers) as? DICT {
                        if let weatherFocast = WeatherFocast(dict: results) {
                            DispatchQueue.main.async {
                                complete(weatherFocast)
                            }
                        }
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            })
            task.resume()
        }
    }
    
    
}
