//
//  UIButton+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func BtnCustom() -> UIButton {
    return UIButton.init(type: UIButtonType.custom)
}

func BtnCustom(_ rect: CGRect) -> UIButton {
    return UIButton(frame: rect)
}

func Btn(_ type: UIButtonType) -> UIButton {
    return UIButton.init(type: type)
}

extension UIButton
{
    
    func btnNorTitle(_ title: String?) -> UIButton {
        self.setTitle(title, for: UIControlState.normal)
        return self
    }
    
    func btnNorImage(_ image: UIImage?) -> UIButton {
        self.setImage(image, for: UIControlState.normal)
        return self
    }
    
    func btnNorAttribute(_ atri: NSAttributedString?) -> UIButton {
        self.setAttributedTitle(atri, for: UIControlState.normal)
        return self
    }
    
    func btnNorTitleColor(_ color: UIColor?) -> UIButton {
        self.setTitleColor(color, for: UIControlState.normal)
        return self
    }
    
    func btnNorBgImage(_ image: UIImage?) -> UIButton {
        self.setBackgroundImage(image, for: UIControlState.normal)
        return self
    }
    
    func btnNorTitleShadowColor(_ color: UIColor?) -> UIButton {
        self.setTitleShadowColor(color, for: UIControlState.normal)
        return self
    }
    
    
    
    func btnSeleTitle(_ title: String?) -> UIButton {
        self.setTitle(title, for: UIControlState.selected)
        return self
    }
    
    func btnSeleImage(_ image: UIImage?) -> UIButton {
        self.setImage(image, for: UIControlState.selected)
        return self
    }
    
    func btnSeleAttribute(_ atri: NSAttributedString?) -> UIButton {
        self.setAttributedTitle(atri, for: UIControlState.selected)
        return self
    }
    
    func btnSeleTitleColor(_ color: UIColor?) -> UIButton {
        self.setTitleColor(color, for: UIControlState.selected)
        return self
    }
    
    func btnSeleBgImage(_ image: UIImage?) -> UIButton {
        self.setBackgroundImage(image, for: UIControlState.selected)
        return self
    }
    
    func btnSeleTitleShadowColor(_ color: UIColor?) -> UIButton {
        self.setTitleShadowColor(color, for: UIControlState.selected)
        return self
    }
    
    
    
    func btnFont(_ font: UIFont?) -> UIButton {
        self.titleLabel?.font = font
        return self
    }
    
    func btnClick(_ target: Any?, _ action: Selector) -> UIButton {
        self.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        return self
    }
    
    func btnClick(_ target: Any?, _ action: Selector, _ events: UIControlEvents) -> UIButton {
        self.addTarget(target, action: action, for: events)
        return self
    }
    
    func btnBreakMode(_ mode: NSLineBreakMode) -> UIButton {
        self.titleLabel?.lineBreakMode = mode
        return self
    }
    
    func btnAlign(_ align: UIControlContentHorizontalAlignment) -> UIButton {
        self.contentHorizontalAlignment = align
        return self
    }
    
    func btnSelect(_ sele: Bool) -> UIButton {
        self.isSelected = sele
        return self
    }
    
    func btnEnable(_ enable: Bool) -> UIButton {
        self.isEnabled = enable
        return self
    }
    
    func btnImageInsets(_ inserts: UIEdgeInsets) -> UIButton {
        self.imageEdgeInsets = inserts
        return self
    }
    
    func btnTitleInsets(_ inserts: UIEdgeInsets) -> UIButton {
        self.titleEdgeInsets = inserts
        return self
    }
    
}

