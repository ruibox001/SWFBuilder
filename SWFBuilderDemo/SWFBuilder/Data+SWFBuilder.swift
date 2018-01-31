//
//  Data+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

extension Data
{
    func dataToDict() -> Dictionary<String, Any>? {
        do {
            
           let json = try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.mutableContainers)
            let dict = json as! Dictionary<String, Any>
            return dict
        } catch _ {
            
        }
        return nil
    }
    
    func dataToString() -> String {
        return String.init(data: self, encoding: String.Encoding.utf8)!
    }
    
    func dataToImage(_ imageData: Data) -> UIImage {
        return UIImage.init(data: self)!
    }
    
}

