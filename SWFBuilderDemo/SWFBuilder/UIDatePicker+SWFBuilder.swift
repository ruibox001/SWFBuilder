//
//  UITableView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

let ChinaLocale = NSLocale(localeIdentifier: "zh_CN")

func DatePicker() -> UIDatePicker {
    return UIDatePicker()
}

func DatePicker(_ rect: CGRect) -> UIDatePicker {
    return UIDatePicker(frame: rect)
}

extension UIDatePicker
{
    
    func datePickerMode(_ mode: UIDatePickerMode) -> UIDatePicker {
        self.datePickerMode = mode
        return self
    }
    
    func datePickerLocale(_ locale: Locale?) -> UIDatePicker {
        self.locale = locale
        return self
    }
    
    func datePickerCalendar(_ calendar: Calendar) -> UIDatePicker {
        self.calendar = calendar
        return self
    }
    
    func datePickerTimeZone(_ timeZone: TimeZone?) -> UIDatePicker {
        self.timeZone = timeZone
        return self
    }
    
    func datePickerDate(_ date: Date) -> UIDatePicker {
        self.date = date
        return self
    }
    
    func datePickerSetDate(_ date: Date, _ ani: Bool) -> UIDatePicker {
        self.setDate(date, animated: ani)
        return self
    }
    
    /**
     倒计时属性
     相关说明：1.该属性设置倒计时需要倒计的秒数。
     2.如果时间选择器的时间模式不是倒计时模式，则该属性会被忽略。
     3.默认值是0.0，最大值为23:59（86399秒）。
     NwDatePicker.countDownDuration  = 86399
     */
    func datePickerCountDown(_ countDownSecond: TimeInterval) -> UIDatePicker {
        self.countDownDuration = countDownSecond
        return self
    }
    
    /**
     时间分钟间隔属性
     相关说明：1.使用该属性设置由分钟车轮显示的时间间隔。
     2.间隔值必须均匀地分隔60，如果没有这样做，该属性将使用默认值为1。
     3.该属性值的范围是大于等于1，并小于等于30
    NwDatePicker.minuteInterval = 2
    */
    func datePickerMinuteInterval(_ minuteInterval: Int) -> UIDatePicker {
        self.minuteInterval = minuteInterval
        return self
    }
    
    
    func datePickerMinDate(_ date: Date?) -> UIDatePicker {
        self.minimumDate = date
        return self
    }
    
    func datePickerMaxDate(_ date: Date?) -> UIDatePicker {
        self.maximumDate = date
        return self
    }
    
    func datePickerTargetSel(_ target: Any?,_ action: Selector,_ events: UIControlEvents) -> UIDatePicker {
        self.addTarget(target, action: action, for: events)
        return self
    }
    
}

