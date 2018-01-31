//
//  SFUtils.swift
//  TestSwift
//
//  Created by wsy on 2018/1/17.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit


let phoneWidth = UIScreen.main.bounds.size.width
let phoneHeight = UIScreen.main.bounds.size.height

let appVersion:String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
let phoneIdentifier = UIDevice.current.identifierForVendor?.uuidString
let phoneVersion  = UIDevice.current.systemVersion
let phoneModel = UIDevice.current.systemName

