//
//  configSFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/12.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

/*配置SWFBuilder常量信息*/

//WebView加载进度默认颜色
let DF_WebViewLoadProgressColor = color("10E010")

//导航栏返回键图片名称
let DF_NavigationBackImageName = "back"
//导航栏标题字体大小
let DF_NavigationTitleFontSize: CGFloat = 18.0
//导航栏左右label的字体大小
let DF_NavigationLeftRightFontSize: CGFloat = 14
//导航栏左右label的字体颜色
let DF_NavigationLeftRightLabelColor = UIColor.black

//TableView没有数据时展示图片的名称
let DF_TableViewNoDataImage = UIImage(named: "empty")

//系统UIImageView默认的placeholder图片名称
let DF_UIImagePlaceHolderImage = UIImage(named: "placeholder")

//系统自定义指定字体名称
let DF_MyCustomFontName = ""

//后台模式时需要默默播放的文件名称
let DF_ApplicatonBackgroundModePlayFileName = "1.wav"


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
    
    //初始化tableView无数据方法交换
    UITableView.initializes()
    
    //后台和前台初始化
    AppDelegate.initializes()
}


