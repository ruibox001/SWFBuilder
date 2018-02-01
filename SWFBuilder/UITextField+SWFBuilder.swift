//
//  UITextField+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func TextField() -> UITextField {
    return UITextField()
}

func TextField(_ rect: CGRect) -> UITextField {
    return UITextField(frame: rect)
}

extension UITextField
{
    
    func textFieldFont(_ font: UIFont) -> UITextField {
        self.font = font
        return self
    }
    
    func textFieldTextColor(_ color: UIColor) -> UITextField {
        self.textColor = color
        return self
    }
    
    func textFieldAlign(_ align: NSTextAlignment) -> UITextField {
        self.textAlignment = align
        return self
    }
    
    func textFieldHolder(_ text: String) -> UITextField {
        self.placeholder = text
        return self
    }
    
    func textFieldIsSecure(_ isSecurity: Bool) -> UITextField {
        self.isSecureTextEntry = isSecurity
        return self
    }
    
    func textFieldBorderStyle(_ sty: UITextBorderStyle) -> UITextField {
        self.borderStyle = sty
        return self
    }
    
    func textFieldDelegate(_ delegate: UITextFieldDelegate?) -> UITextField {
        self.delegate = delegate
        return self
    }
    
    func textFieldLeftView(_ view: UIView?) -> UITextField {
        self.leftViewMode = UITextFieldViewMode.always
        self.leftView = view
        return self
    }
    
    func textFieldNullLeftView() -> UITextField {
        return textFieldLeftView(View().viewRect(makeRect(0, 0, 10, 10)))
    }
    
    func textFieldLeftViewOffset(_ offset: CGFloat) -> UITextField {
        return textFieldLeftView(View().viewRect(makeRect(0, 0, offset, 10)))
    }
    
    func textFieldRightView(_ view: UIView?) -> UITextField {
        self.rightViewMode = UITextFieldViewMode.always
        self.rightView = view
        return self
    }
    
    func textFieldClearBtnMode(_ mode: UITextFieldViewMode) -> UITextField {
        self.clearButtonMode = mode
        return self
    }
    
    func textFieldKeyBoardType(_ type: UIKeyboardType) -> UITextField {
        self.keyboardType = type
        return self
    }
    
    func textFieldReturnKeyType(_ type: UIReturnKeyType) -> UITextField {
        self.returnKeyType = type
        return self
    }
    
    func textFieldInputView(_ view: UIView?) -> UITextField {
        self.inputView = view
        return self
    }
    
    func textFieldAccessoryView(_ view: UIView?) -> UITextField {
        self.inputAccessoryView = view
        return self
    }
    
}

