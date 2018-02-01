//
//  Dictionary+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

extension Dictionary
{
    func dictToString() -> String? {
        return self.dictToData()?.dataToString()
    }
    
    func dictToData() -> Data? {
        
        do {
            let j = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
            return j
        } catch _ {
            
        }
        return nil
    }
    
    func dictMacthKey(_ key: String) -> Bool {
        for k in self.keys {
            if key == "\(k)" {
                return true
            }
        }
        return false
    }
    
    func dictValueForKey(_ key: Key) -> Any? {
        return self[key]
    }
    
   
    
}

