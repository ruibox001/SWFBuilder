//
//  NSObject+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

extension NSObject
{
    
    class func objSwizzlingOrReplaceMethod(originSelector: Selector, newSelector: Selector) {
        
        let originalMethod = class_getInstanceMethod(self, originSelector)
        let swizzledMethod = class_getInstanceMethod(self, newSelector)
        
        let didAddMethod:Bool = class_addMethod(self, originSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))
        if didAddMethod {
            class_replaceMethod(self, newSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        }else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
        
    }
    
    func objectPointer() -> String {
        return "\(Unmanaged.passUnretained(self).toOpaque())"
    }
    
    func objectToJsonString() -> String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
            return String.init(data: data, encoding: String.Encoding.utf8)
        } catch _ {
            
        }
        return nil
    }
    
}

