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
    
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "MMM dd"
    
    let todaydate : NSDate = NSDate()
    let today = dateFormatterPrint.string(from: todaydate as Date)
    
    // Check to see if date is Valid
    var dateCheck: NSDate? = dateFormatterGet.date(from: publishDate) as NSDate?
    
    if (dateCheck == nil){
        dateCheck = todaydate
    }
    let pubDate = (dateFormatterPrint.string(from: (dateCheck! )as Date))
    
    if(pubDate == today){
        return "Today"
    }else{
        return pubDate
    }
}
