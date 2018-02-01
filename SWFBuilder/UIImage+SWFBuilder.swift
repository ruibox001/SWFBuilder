//
//  UIImage+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

let imagePlaceHolderImage: UIImage = "placeholder".strToImage()

func imageWithName(_ name: String) -> UIImage? {
    return name.strToImage()
}

func imageWithPath(_ path: String) -> UIImage {
    return path.strImagePathToImage()
}

extension UIImage
{
    
    func imageSize() -> CGSize {
        return self.size
    }
    
    func imageScaleWidth(_ scaleHeight: CGFloat) -> CGFloat {
        return (self.size.width*scaleHeight/self.size.height)
    }
    
    func imageScaleHeight(_ scaleWidth: CGFloat) -> CGFloat {
        return (self.size.height*scaleWidth/self.size.width)
    }
    
    func imageChangeImageWithColor(_ color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        let rect: CGRect = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context?.clip(to: rect, mask: self.cgImage!)
        color.setFill()
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func imageToCircleImage() -> UIImage {
        UIGraphicsBeginImageContext(self.size)
        let context = UIGraphicsGetCurrentContext()
        let rect: CGRect = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context?.addEllipse(in: rect)
        context?.clip()
        self.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func imageScaleWithSize(_ size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(self.size)
        let rect: CGRect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        self.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}

