//
//  configSFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/12.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

//打印信息LOG
let printLog = 1
func Dlog(_ log: Any...){
    if printLog == 1 {
        print(log.last!)
    }
}

//系统统一初始化入口,只执行一次
func SWFBuilderPublicInit() {
    
    Dlog("当前版本：\(appVersion)")
    Dlog("初始化公共方法")
    
    //初始化导航栏的方法
    UINavigationController.initializes()
}


