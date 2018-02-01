//
//  SFUtils.swift
//  TestSwift
//
//  Created by wsy on 2018/1/17.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

public protocol LoadProtocol {
    static func load()
}

func InitSelfLoadProtocol(){
    Dlog("InitSelfLoadProtocol")
//    let typeCount = Int(objc_getClassList(nil, 0))
//    let  types = UnsafeMutablePointer<AnyClass?>.allocate(capacity: typeCount)
//    let autoreleaseintTypes = AutoreleasingUnsafeMutablePointer<AnyClass?>(types)
//    objc_getClassList(autoreleaseintTypes, Int32(typeCount)) //获取所有的类
//    for index in 0 ..< typeCount{
//        (types[index] as? SelfLoad.Type)?.load() //如果该类实现了SelfAware协议，那么调用awake方法
//    }
//    types.deallocate(capacity: typeCount)
}

