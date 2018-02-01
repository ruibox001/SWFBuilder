//
//  NSMutableAttributedString+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func MutableAttributedString(_ attributeString: NSAttributedString) -> NSMutableAttributedString {
    return NSMutableAttributedString(attributedString: attributeString)
}

func MutableAttributedString(_ string: String) -> NSMutableAttributedString {
    return NSMutableAttributedString(string: string)
}

extension NSMutableAttributedString
{
    
    func mutableAttributedStringAppend(_ attributeString: NSAttributedString) -> NSMutableAttributedString {
        self.append(attributeString)
        return self
    }
    
    func mutableAttributedStringAppend(_ attributeString: NSAttributedString, at loc: Int) -> NSMutableAttributedString {
        self.insert(attributeString, at: loc)
        return self
    }
    
}

