//
//  DateUtilis.swift
//  CCC
//
//  Created by Alessio Sardella on 12/09/2019.
//  Copyright © 2019 Alessio Sardella. All rights reserved.
//

import Foundation

class DateUtils {
    
    public static let defaultDate: Date = Date(timeIntervalSince1970: 0)
    
    ///Convert Date object in readable string with custom format
    public static func getStringFromDate(_ date: Date, withFormat format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let stringFromDate = dateFormatter.string(from: date)
        return stringFromDate
    }
    
    ///Convert  string in Date object
    public static func getDateFromString(_ stringDate: String, withFormat format: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        guard let datefromString = dateFormatter.date(from: stringDate) else {
            return defaultDate
        }
        return datefromString
    }
}
