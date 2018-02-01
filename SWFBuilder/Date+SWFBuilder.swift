//
//  Date+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

let dateFormatYYYYMMDDHHMMSS = "yyyy-MM-dd HH:mm:ss"
let dateFormatYYYYMMDD = "yyyy-MM-dd"
let dateFormatYY年MM月DD日 = "yy年MM月dd日"
let dateFormatYYYY年MM月DD日 = "yyyy年MM月dd日"

let dateFormator: DateFormatter = DateFormatter()

func currentDateWithFormat(_ format: String) -> String {
    return Date().dateFormat(format)
}

extension Date
{
    
    func dateFormat(_ format: String) -> String {
        dateFormator.dateFormat = format
        return dateFormator.string(from: self)
    }
    
    func dateNowBiggerThanDate(_ date: Date) -> Bool {
        let m:TimeInterval = self.timeIntervalSince(date)
        if m >= 0 {
            return true;
        }
        return false;
    }
    
    func dateNowToSeconds() -> TimeInterval {
        return self.timeIntervalSince1970
    }
    
    func dateAddDays(_ day: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(60*60*24*day))
    }
    
    func dateDelDays(_ day: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(-60*60*24*day))
    }
    
    func dateAddHours(_ hours: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(60*60*hours))
    }
    
    func dateDelHours(_ hours: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(-60*60*hours))
    }
    
    func dateAddMinutes(_ minutes: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(60*minutes))
    }
    
    func dateDelMinutes(_ minutes: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(-60*minutes))
    }
    
    func dateAddSeconds(_ seconds: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(seconds))
    }
    
    func dateDelSeconds(_ seconds: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(-seconds))
    }
    
}

