//
//  UISwitch+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func Switch() -> UISwitch {
    return UISwitch()
}

func Switch(_ rect: CGRect) -> UISwitch {
    return UISwitch(frame: rect)
}

extension UISwitch
{
    
    func switchSetOn(_ on: Bool) -> UISwitch {
        self.isOn = on
        return self
    }
    
    func switchSetOn(_ on: Bool, animation ani: Bool) -> UISwitch {
        self.setOn(on, animated: ani)
        return self
    }
    
    func switchOnTintColor(_ color: UIColor) -> UISwitch {
        self.onTintColor = color
        return self
    }
    
    func switchTintColor(_ color: UIColor) -> UISwitch {
        self.tintColor = color
        return self
    }
    
    func switchThumColor(_ color: UIColor) -> UISwitch {
        self.thumbTintColor = color
        return self
    }
    
    func switchTargetSel(_ target: Any?, _ action: Selector, _ event: UIControlEvents) -> UISwitch {
        self.addTarget(target, action: action, for: event)
        return self
    }
    
    func switchOnImage(_ image: UIImage) -> UISwitch {
        self.onImage = image
        return self
    }
    
    func switchOffImage(_ image: UIImage) -> UISwitch {
        self.offImage = image
        return self
    }
    
}

