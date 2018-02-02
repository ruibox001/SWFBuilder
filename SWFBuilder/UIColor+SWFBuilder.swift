//
//  UIColor+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func color(_ color: String) -> UIColor {
    return UIColor.colorWithString(color)
}

extension UIColor
{
    
    func colorImage() -> UIImage{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func colorToImageWithSize(_ size: CGSize) -> UIImage{
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func colorAlpha(_ alpha: CGFloat) -> UIColor {
        return self.withAlphaComponent(alpha)
    }
    
    class func colorWithString(_ colorString: String) -> UIColor {
        
        let cString = colorString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()
        var alpha: CGFloat = 1
        var hex = cString
        
        if cString.contains(",") {
            
            let sString: NSString = cString as NSString
            let ids: NSRange = sString.range(of: ",")

            let colorIndex      = cString.index(cString.startIndex, offsetBy: ids.location)
            let colorString     = cString.prefix(upTo: colorIndex)
            hex = String(colorString)
            
            let alphaIndex      = cString.index(cString.endIndex, offsetBy: -(sString.length-ids.location-ids.length))
            let alphaString     = cString.suffix(from: alphaIndex)
            alpha = CGFloat((alphaString as NSString).doubleValue)
            
        }
        return colorWithHex(hex, alpha)
    }
    
    private class func colorWithHex(_ hex: String, _ alpha: CGFloat) -> UIColor{
        
        if hex == "random" {
            let r = arc4random_uniform(256)
            let g = arc4random_uniform(256)
            let b = arc4random_uniform(256)
            return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
        }
        
        if hex.hasPrefix("0x") {
            let s: String = String(hex.suffix(hex.count-2))
            return colorWithHex(s,alpha)
        }
        if hex.hasPrefix("#") {
            let s: String = String(hex.suffix(hex.count-1))
            return colorWithHex(s,alpha)
        }
        
        if hex.count == 3 {
            
            let rIndex      = hex.index(hex.startIndex, offsetBy: 1)
            let rString     = hex.prefix(upTo: rIndex)
            
            let otherString = hex.suffix(from: rIndex)
            
            let gIndex      = otherString.index(otherString.startIndex, offsetBy: 1)
            let gString     = otherString.prefix(upTo: gIndex)
            
            let bIndex      = hex.index(hex.endIndex, offsetBy: -1)
            let bString     = hex.suffix(from: bIndex)
            
            var r:CUnsignedInt  = 0,g:CUnsignedInt = 0 ,b:CUnsignedInt = 0
            Scanner(string: String("\(rString)\(rString)")).scanHexInt32(&r)
            Scanner(string: String("\(gString)\(gString)")).scanHexInt32(&g)
            Scanner(string: String("\(bString)\(bString)")).scanHexInt32(&b)
            return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
        }
        
        if hex.count != 6 {
            return UIColor.clear
        }
        
        let rIndex      = hex.index(hex.startIndex, offsetBy: 2)
        let rString     = hex.prefix(upTo: rIndex)
        
        let otherString = hex.suffix(from: rIndex)
        
        
        let gIndex      = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString     = otherString.prefix(upTo: gIndex)
        
        let bIndex      = hex.index(hex.endIndex, offsetBy: -2)
        let bString     = hex.suffix(from: bIndex)
        
        var r:CUnsignedInt  = 0,g:CUnsignedInt = 0 ,b:CUnsignedInt = 0
        Scanner(string: String(rString)).scanHexInt32(&r)
        Scanner(string: String(gString)).scanHexInt32(&g)
        Scanner(string: String(bString)).scanHexInt32(&b)
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
    
}

