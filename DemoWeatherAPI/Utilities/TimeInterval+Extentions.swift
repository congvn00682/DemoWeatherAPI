//
//  TimeInterval+Extentions.swift
//  DemoWeatherAPI
//
//  Created by Vu Ngoc Cong on 5/22/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    func toString(with fomat: String) -> String {
        let formater = DateFormatter()
        formater.dateFormat = fomat
        formater.locale = Locale(identifier: "vi-VN")
        let today = formater.string(from: Date(timeIntervalSince1970: self))
        let date = Date()
        let currentDate = formater.string(from: date)
        return currentDate == today ? today : today
    }
    
    func getCurrentDateTime(convert dateTimeInterval: TimeInterval) -> String{
        let formater = DateFormatter()
        // lay thu tư TimeInterval
        formater.dateFormat = "EEEE"
        // chuyen doi thanh tieng viet
        formater.locale = Locale(identifier: "vi-VN")
        // lay gio he thong
        let today = formater.string(from: Date(timeIntervalSince1970: dateTimeInterval))
        let date = Date()
        let currentDate = formater.string(from: date)
        return currentDate == today ? today : today
        
    }
}
