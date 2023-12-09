//
//  Date.swift
//  Taskcy
//
//  Created by 김시연 on 2023/12/01.
//

import Foundation

extension Date {
    func getDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // 2020-08-13 16:30
        return dateFormatter.string(from: self)
    }
    
    func getTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm" // 2020-08-13 16:30
        return dateFormatter.string(from: self)
    }
}
