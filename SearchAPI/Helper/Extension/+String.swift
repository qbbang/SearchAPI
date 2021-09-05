//
//  +String.swift
//  SearchAPI
//
//  Created by 이규현 on 2021/09/06.
//

import Foundation

extension String {
    func formatUpdateAt() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let currntStr = dateFormatter.string(from: Date())
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        guard let current = dateFormatter.date(from: currntStr) else { return "" }
        guard let update = dateFormatter.date(from: self) else { return "" }
        guard let diffDay = Calendar.current.dateComponents([.day], from: update, to: current).day else { return "" }
        
        if diffDay > 30 {
            let calender = Calendar.current
            let year = calender.component(.year, from: update)
            let mon = calender.component(.month, from: update)
            let day = calender.component(.day, from: update)
            return "Updated on \(day) \(intToMonth(mon)) \(year)"
        } else {
            switch diffDay {
            case 0:
                return "Updated Todays"
            case 1:
                return "Updated yesterday"
            default:
                return "Updated \(diffDay) days ago"
            }
        }
    }
    
    private func intToMonth(_ num: Int) -> String {
        switch num {
        case 1:
            return "Jan"
        case 2:
            return "Feb"
        case 3:
            return "Mar"
        case 4:
            return "Apr"
        case 5:
            return "May"
        case 6:
            return "June"
        case 7:
            return "July"
        case 8:
            return "Aug"
        case 9:
            return "Sep"
        case 10:
            return "Oct"
        case 11:
            return "Nov"
        case 12:
            return "Dec"
        default:
            return ""
        }
    }
}
