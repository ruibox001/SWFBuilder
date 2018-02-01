//
//  NSAttributedString+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func AttributedString() -> NSAttributedString {
    return NSAttributedString()
}

func AttributedString(_ string: String) -> NSAttributedString {
    return NSAttributedString(string: string)
}

func AttributedString(_ astring: NSAttributedString) -> NSAttributedString {
    return NSAttributedString(attributedString: astring)
}

func AttributedString(_ string: String, _ paragraphStyle: NSMutableParagraphStyle) -> NSAttributedString {
    let attrs: NSDictionary = [NSAttributedStringKey.paragraphStyle : paragraphStyle]
    return NSAttributedString.init(string: string, attributes: attrs as? [NSAttributedStringKey : Any])
}

func AttributedString(_ string: String, _ font: UIFont) -> NSAttributedString {
    let attrs: NSDictionary = [NSAttributedStringKey.font : font]
    return NSAttributedString.init(string: string, attributes: attrs as? [NSAttributedStringKey : Any])
}

func AttributedString(_ string: String, _ paragraphStyle: NSMutableParagraphStyle, _ font: UIFont) -> NSAttributedString {
    let attrs: NSDictionary = [NSAttributedStringKey.paragraphStyle : paragraphStyle, NSAttributedStringKey.font : font]
    return NSAttributedString.init(string: string, attributes: attrs as? [NSAttributedStringKey : Any])
}

func AttributedString(_ string: String, attributes attrs: [NSAttributedStringKey : Any]?) -> NSAttributedString {
    return NSAttributedString.init(string: string, attributes: attrs)
}

func AttributedString(_ string: String, attributes attrs: [NSAttributedStringKey : Any]?, _ font: UIFont) -> NSAttributedString {
    let dict: NSMutableDictionary = NSMutableDictionary.init(dictionary: attrs!)
    dict.setObject(font, forKey: NSAttributedStringKey.font as NSCopying)
    return NSAttributedString.init(string: string, attributes: dict as? [NSAttributedStringKey : Any])
}

extension NSAttributedString
{
    
    func attributedStringToMutableAttributeString() -> NSMutableAttributedString {
        return NSMutableAttributedString(attributedString: self)
    }
    
    func attributedStringAddAttributes() -> NSAttributedString {
        return self
    }
    
}

