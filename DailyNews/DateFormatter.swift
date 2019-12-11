//
//  DateFormatter.swift
//  DailyNews
//
//  Created by Adebayo Oriyomi on 2019-10-03.
//  Copyright © 2019 Adebayo Oriyomi. All rights reserved.
//

import Foundation


func dateFormat(publishDate: String) -> String{

    let dateFormatter = ISO8601DateFormatter()
    guard let date = dateFormatter.date(from: publishDate) else {
        return "Today"
    }
    //let date = dateFormatter.date(from:publishDate)!
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
