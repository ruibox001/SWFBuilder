//
//  UILabel+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func Label() -> UILabel {
    return UILabel()
}

func Label(_ rect: CGRect) -> UILabel {
    return UILabel(frame: rect)
}

extension UILabel
{
    
    func labelText(_ text: String) -> UILabel {
        self.text = text
        return self
    }
    
    func labelFont(_ font: UIFont) -> UILabel {
        self.font = font
        return self
    }
    
    func labelColor(_ color: UIColor) -> UILabel {
        self.textColor = color
        return self
    }
    
    func labelAlign(_ align: NSTextAlignment) -> UILabel {
        self.textAlignment = align
        return self
    }
    
    func labelAttriStr(_ attributeString: NSAttributedString) -> UILabel {
        self.attributedText = attributeString
        return self
    }
    
    func labelLineNum(_ num: NSInteger) -> UILabel {
        self.numberOfLines = num
        return self
    }
    
    func labelBreakMode(_ mode: NSLineBreakMode) -> UILabel {
        self.lineBreakMode = mode
        return self
    }
    
    func labelAdjustFntToFitWidth() -> UILabel {
        self.adjustsFontSizeToFitWidth = true
        return self
    }
    
    func labelHighLightColor(_ color: UIColor) -> UILabel {
        self.isHighlighted = true
        self.highlightedTextColor = color
        return self
    }
    
    func labelShadow(_ color: UIColor, _ offset: CGSize) -> UILabel {
        self.shadowColor = color
        self.shadowOffset = offset
        return self
    }
    
}

