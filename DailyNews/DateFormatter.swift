//
//  DateFormatter.swift
//  DailyNews
//
//  Created by Adebayo Oriyomi on 2019-10-03.
//  Copyright © 2019 Adebayo Oriyomi. All rights reserved.
//

import Foundation


func dateFormat(publishDate: String) -> String{
    
    // Date Formatter Starts HERE
    
//    let dateFormatterGet = DateFormatter()
//    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//
//    let dateFormatterPrint = DateFormatter()
//    dateFormatterPrint.dateFormat = "MMM dd"
//
//    let todaydate : NSDate = NSDate()
//    let today = dateFormatterPrint.string(from: todaydate as Date)
//
//    // Check to see if date is Valid
//    var dateCheck: NSDate? = dateFormatterGet.date(from: publishDate) as NSDate?
//
//    if (dateCheck == nil){
//        dateCheck = todaydate
//    }
//    let pubDate = (dateFormatterPrint.string(from: (dateCheck! )as Date))
//
//    if(pubDate == today){
//        return "Today"
//    }else{
//        return pubDate
//    }
    
    //let isoDate = "2019-10-19T17:13:41Z"

    let dateFormatter = ISO8601DateFormatter()
    let date = dateFormatter.date(from:publishDate)!
    return (date.timeAgoDisplay())
}
    
extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        if secondsAgo < minute {
            return "\(secondsAgo) seconds ago"
        }
            
        else if secondsAgo < hour {
            return "\(secondsAgo / minute) minutes ago"
        }
        else if secondsAgo < day {
            return "\(secondsAgo / hour) hours ago"
        }
        else if secondsAgo < week {
            return "\(secondsAgo / day) days ago"
        }
        return "\(secondsAgo / week) weeks ago"
    }
}
