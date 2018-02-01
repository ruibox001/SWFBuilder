//
//  NSAttributedString+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func MutableParagraphStyle() -> NSMutableParagraphStyle {
    return NSMutableParagraphStyle()
}

extension NSMutableParagraphStyle
{
    
    //截断模式
    func paragraphStyle(_ style: NSLineBreakMode) -> NSMutableParagraphStyle {
        self.lineBreakMode = style
        return self
    }
    
    //对齐方式
    func paragraphAlign(_ align: NSTextAlignment) -> NSMutableParagraphStyle {
        self.alignment = align
        return self
    }
    
    //行间距
    func paragraphLineSpace(_ space: CGFloat) -> NSMutableParagraphStyle {
        self.lineSpacing = space
        return self
    }
    
    //行间距多少倍
    func paragraphLineMultiple(_ multiple: CGFloat) -> NSMutableParagraphStyle {
        self.lineHeightMultiple = multiple
        return self
    }
    
    //段落间距
    func paragraphParagraphSpace(_ space: CGFloat) -> NSMutableParagraphStyle {
        self.paragraphSpacing = space
        return self
    }
    
    //每段的首行缩进
    func paragraphFirstLineHead(_ firstLineHead: CGFloat) -> NSMutableParagraphStyle {
        self.firstLineHeadIndent = firstLineHead
        return self
    }
    
    //每段的首行缩进
    func paragraphHeadIndent(_ headIndent: CGFloat) -> NSMutableParagraphStyle {
        self.headIndent = headIndent
        return self
    }
    
    //右侧缩进或显示宽度
    func paragraphTailIndent(_ tailIndent: CGFloat) -> NSMutableParagraphStyle {
        self.headIndent = tailIndent
        return self
    }
    
    //段落间距
    func paragraphSpacingBefore(_ paragraphSpacingBefore: CGFloat) -> NSMutableParagraphStyle {
        self.paragraphSpacingBefore = paragraphSpacingBefore
        return self
    }
    
    //连字符属性 指定连字符门限，有效值在0~1.0之间
    func paragraphHyphenationFactor(_ hyphenationFactor: CGFloat) -> NSMutableParagraphStyle {
        self.hyphenationFactor = Float(hyphenationFactor)
        return self
    }
    
}

