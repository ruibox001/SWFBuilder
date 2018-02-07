//
//  NSObject+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

extension CGRect
{
    
    func rectX() -> CGFloat {
        return self.origin.x
    }
    
    func rectY() -> CGFloat {
        return self.origin.y
    }
    
    func rectW() -> CGFloat {
        return self.size.width
    }
    
    func rectH() -> CGFloat {
        return self.size.height
    }
    
    func rectSize() -> CGSize {
        return self.size
    }
    
    func rectPoint() -> CGPoint {
        return self.origin
    }
    
    func rectSetX(_ x: CGFloat) -> CGRect {
        var f: CGRect = self
        f.origin.x = x
        return f
    }
    
    func rectSetY(_ y: CGFloat) -> CGRect {
        var f: CGRect = self
        f.origin.y = y
        return f
    }
    
    func rectSetW(_ w: CGFloat) -> CGRect {
        var f: CGRect = self
        f.size.width = w
        return f
    }
    
    func rectSetH(_ h: CGFloat) -> CGRect {
        var f: CGRect = self
        f.size.height = h
        return f
    }
    
    func rectSetSize(_ size: CGSize) -> CGRect {
        var f: CGRect = self
        f.size = size
        return f
    }
    
    func rectSetPoint(_ point: CGPoint) -> CGRect {
        var f: CGRect = self
        f.origin = point
        return f
    }
    
}

