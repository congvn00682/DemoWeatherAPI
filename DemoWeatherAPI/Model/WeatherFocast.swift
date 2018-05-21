//
//  WeatherFocast.swift
//  DemoWeatherAPI
//
//  Created by Vu Ngoc Cong on 5/21/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import Foundation

typealias DICT = Dictionary<AnyHashable, Any>

class WeatherFocast {
    var name: String
    var localtime_epoch: TimeInterval
    var temp_c: Double
    var condition: Condition
    var forecastday: [Forecastday] = []
    
    init?(dict: DICT) {
        guard let location = dict["location"] as? DICT else { return nil }
        guard let name = location["name"] as? String else { return nil }
        guard let localtime_epoch = location["localtime_epoch"] as? TimeInterval else { return nil }
        guard let current = dict["current"] as? DICT else { return nil }
        guard let temp_c = current["temp_c"] as? Double else { return nil }
        guard let condition = current["condition"] as? DICT else { return nil }
        guard let conditionObject = Condition(dict: condition) else { return nil }
        guard let forecast = dict["forecast"] as? DICT else { return nil }
        guard let forecastday = forecast["forecastday"] as? [DICT] else { return nil }
        for day in forecastday {
            if let dayObject = Forecastday(dict: day) {
                self.forecastday.append(dayObject)
            }
        }
        self.name = name
        self.localtime_epoch = localtime_epoch
        self.condition = conditionObject
        self.temp_c = temp_c
    }
}

struct Forecastday {
    var date_epoch: TimeInterval
    var maxtemp_c: Double
    var mintemp_c: Double
    var condition: Condition
    init?(dict: DICT) {
        guard let date_epoch = dict["date_epoch"] as? TimeInterval else { return nil }
        guard let day = dict["day"] as? DICT else { return nil }
        guard let maxtemp_c = day["maxtemp_c"] as? Double else { return nil }
        guard let mintemp_c = day["mintemp_c"] as? Double else { return nil }
        guard let condition = day["condition"] as? DICT else { return nil }
        guard let conditionObject = Condition(dict: condition) else { return nil }
        self.date_epoch = date_epoch
        self.maxtemp_c = maxtemp_c
        self.mintemp_c = mintemp_c
        self.condition = conditionObject
    }
}

struct Condition {
    var text: String
    var icon: String
    init?(dict: DICT) {
        guard let text = dict["text"] as? String else { return nil }
        guard let icon = dict["icon"] as? String else { return nil }
        self.text = text
        self.icon = "http:"+icon
    }
}
