//
//  UITextView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func TextView() -> UITextView {
    return UITextView()
}

func TextView(_ rect: CGRect) -> UITextView {
    return UITextView(frame: rect)
}

extension UITextView
{
    
    func textViewborder(_ width: CGFloat, _ borderColor: UIColor) -> UITextView {
        self.layer.borderWidth = width
        self.layer.borderColor = borderColor.cgColor
        return self
    }
    
    func textViewIsEdit(_ editable: Bool) -> UITextView {
        self.isEditable = editable
        return self
    }
    
    func textViewIsSelect(_ isSelect: Bool) -> UITextView {
        self.isSelectable = isSelect
        return self
    }
    
    func textViewFont(_ font: UIFont) -> UITextView {
        self.font = font
        return self
    }
    
    func textViewTextColor(_ color: UIColor) -> UITextView {
        self.textColor = color
        return self
    }
    
    func textViewAlign(_ align: NSTextAlignment) -> UITextView {
        self.textAlignment = align
        return self
    }
    
    func textViewDetectorTypes(_ type: UIDataDetectorTypes) -> UITextView {
        self.dataDetectorTypes = type
        return self
    }
    
    func textViewTintColor(_ color: UIColor) -> UITextView {
        self.tintColor = color
        return self
    }
    
    func textViewDelegate(_ delegate: UITextViewDelegate?) -> UITextView {
        self.delegate = delegate
        return self
    }
    
    func textViewInputView(_ view: UIView?) -> UITextView {
        self.inputView = view
        return self
    }
    
    func textViewAccessoryView(_ view: UIView?) -> UITextView {
        self.inputAccessoryView = view
        return self
    }
    
    func textViewAttributeText(_ text: NSAttributedString) -> UITextView {
        self.attributedText = text
        return self
    }
    
    func textViewLinkType(_ link: [String : Any]) -> UITextView {
        self.linkTextAttributes = link
        return self
    }
    
    func textViewKeyBoardType(_ type: UIKeyboardType) -> UITextView {
        self.keyboardType = type
        return self
    }
    
    func textViewReturnKeyType(_ type: UIReturnKeyType) -> UITextView {
        self.returnKeyType = type
        return self
    }
    
    func textViewContentType(_ type: UITextContentType) -> UITextView {
        self.textContentType = type
        return self
    }
    
}

