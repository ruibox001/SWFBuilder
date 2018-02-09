//
//  UIFont+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

//配置默认字体，无配置是设置为""
private let myFontName = DF_MyCustomFontName; //"Zapfino"

//标准系统字体
func fnt(_ font: CGFloat) -> UIFont {
    return UIFont.FontNormalSystemWithFloat(font: font)
}

//获取系统粗体
func fbt(_ font: CGFloat) -> UIFont {
    return UIFont.FontBoldSystemWithFloat(font: font)
}

//获取系统斜体
func fit(_ font: CGFloat) -> UIFont {
    return UIFont.FontItalicSystemWithFloat(font: font)
}

//获取指定字体名称和大小
func fnt(_ fontSize: CGFloat, name fontName: String?) -> UIFont? {
    if fontName == nil {
        if myFontName.count > 0 {
            return UIFont.init(name: myFontName, size: fontSize)
        }
        return UIFont.systemFont(ofSize: fontSize)
    }
    return UIFont.init(name: fontName!, size: fontSize)
}

extension UIFont
{
    
    class func FontNormalSystemWithFloat(font: CGFloat) -> UIFont {
        if myFontName.count > 0 {
            return UIFont.init(name: myFontName, size: font)!
        }
        return UIFont.systemFont(ofSize: font)
    }
    
    class func FontBoldSystemWithFloat(font: CGFloat) -> UIFont {
        if myFontName.count > 0 {
            return UIFont.init(name: myFontName, size: font)!
        }
        return UIFont.boldSystemFont(ofSize: font)
    }
    
    class func FontItalicSystemWithFloat(font: CGFloat) -> UIFont {
        if myFontName.count > 0 {
            return UIFont.init(name: myFontName, size: font)!
        }
        return UIFont.italicSystemFont(ofSize: font)
    }
    
    class func FontFamilyNames() -> [String] {
        return UIFont.familyNames
    }
    
    class func FontNames(familName: String) -> [String] {
        return UIFont.fontNames(forFamilyName: familName)
    }
    
}

