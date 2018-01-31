//
//  SFUtils.swift
//  TestSwift
//
//  Created by wsy on 2018/1/17.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

//获取从0到to的随机数(包含0,不包含to)
func arc4randomTo(_ to: Int) -> Int {
    return Int(arc4random_uniform(UInt32(to)))
}

//获取从from到to的随机数(包含from,不包含to)
func arc4random(_ from: Int, _ to: Int) -> Int {
    return Int(arc4random_uniform(UInt32(to-from))+UInt32(from))
}

func getDocumentPath() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
    return paths[0] as String
}

func getVisibleViewController() -> UIViewController {
    let window: UIWindow = ((UIApplication.shared.delegate?.window)!)!
    let rootViewController: UIViewController = window.rootViewController!
    return SFUtils.getVisibleViewController(viewController: rootViewController)
}

func className(_ obj: NSObject) -> String {
    return "\(obj.classForCoder)"
}
    

