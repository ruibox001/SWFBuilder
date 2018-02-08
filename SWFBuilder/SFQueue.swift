//
//  SFUtils.swift
//  TestSwift
//
//  Created by wsy on 2018/1/17.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

private let queue = DispatchQueue(label: "wangshengyuanqueue")

func DoInSerial(_ block: @escaping ()->Void) {
    queue.async(execute: block)
}

func DoInSerialAfter(_ sec: TimeInterval, _ block: @escaping ()->Void) {
    queue.asyncAfter(deadline: DispatchTime.now() + sec, execute: block)
}

func DoInConcurrent(_ block: @escaping ()->Void) {
    DispatchQueue.global().async(execute: block)
}

func DoInConcurrentAfter(_ sec: TimeInterval, _ block: @escaping ()->Void) {
    DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + sec, execute: block)
}

func DoInMain(_ block: @escaping ()->Void) {
    DispatchQueue.main.async(execute: block)
}

func DoInMainAfter(_ sec: TimeInterval, _ block: @escaping ()->Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + sec, execute: block)
}

func ThreadName() -> String? {
    return Thread.current.name
}
