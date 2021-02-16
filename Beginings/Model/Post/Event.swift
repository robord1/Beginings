//
//  Event.swift
//  Beginings
//
//  Created by rob ord on 13/02/2021.
//

import Foundation

class Event{
    
    
}

//MARK: - DATE EXTENSION
extension Event{
    static func dateToQueryString(date: Date)->String{
        let df = DateFormatter()
        df.dateFormat = EVENT_DATETIME_FORMAT
        let dateTimeString = df.string(from: date)
        return String(dateTimeString[0..<10])
    }
    static func dateToString(date: Date) -> String{
        let df = DateFormatter()
        df.dateFormat = EVENT_DATETIME_FORMAT
        let stringDate = df.string(from: date)
        return stringDate
    }
    static func stringToDate(stringDate: String)->Date?{
        let formatter = DateFormatter()
        formatter.dateFormat = EVENT_DATETIME_FORMAT
        return formatter.date(from: stringDate)
    }
    static func getWeekDay(date: Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let day = dateFormatter.string(from: date)
        return day
    }
    static func getDate(date: Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = EVENT_DATE_FORMAT
        let day = dateFormatter.string(from: date)
        return day
    }
    static func getDay(date: Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = EVENT_DAY_FORMAT
        let day = dateFormatter.string(from: date)
        return day
    }
    static func getTextMonth(date: Date)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = EVENT_MONTH_FORMAT
        let month = dateFormatter.string(from: date)
        return month
    }
    static func getHourMin(date: Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = EVENT_TIME_FORMAT
        let day = dateFormatter.string(from: date)
        return day
    }
    static func dateToShow(currentDate: Date,dayOfEvent:Date)->String{
        let aDay:Double = 60*60*24
        let time = Event.getHourMin(date: dayOfEvent)
        if currentDate.addingTimeInterval(aDay*6) > dayOfEvent{
            let todayWeekDay = Event.getWeekDay(date: currentDate)
            let tomorrowWeekDay = Event.getWeekDay(date: currentDate.addingTimeInterval(aDay))
            let dateWeekDay = Event.getWeekDay(date: dayOfEvent)
            if todayWeekDay == dateWeekDay{
                return "TODAY "+time
            }
            else if tomorrowWeekDay == dateWeekDay{
                return "TOMORROW "+time
            }
            else{
                return dateWeekDay.uppercased()+" "+time
            }
        }else{
            let day = getDay(date: dayOfEvent)
            let month = getTextMonth(date: dayOfEvent)
            return day+" "+month.uppercased()+" "+time
        }
    }
}
extension String{
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}
