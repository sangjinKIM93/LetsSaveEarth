//
//  Date+Extension.swift
//  LetsSaveEarth
//
//  Created by 김상진 on 2021/08/17.
//

import Foundation

extension Date {
    func getHour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter.string(from: self)
    }
    
    func getMinute() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter.string(from: self)
    }
}
