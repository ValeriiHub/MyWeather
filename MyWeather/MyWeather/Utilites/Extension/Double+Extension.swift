//
//  Double+Extension.swift
//  MyWeather
//
//  Created by Valerii on 27.10.2023.
//

import Foundation

extension Double {
    func convertDoubleToString(format: DateFormat) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_us")
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: date)
    }
}
