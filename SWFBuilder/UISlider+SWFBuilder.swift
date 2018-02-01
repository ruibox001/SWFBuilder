//
//  UITableView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func Slider() -> UISlider {
    return UISlider()
}

func Slider(_ rect: CGRect) -> UISlider {
    return UISlider(frame: rect)
}

extension UISlider
{
    
    func sliderMinValue(_ value: CGFloat) -> UISlider {
        self.minimumValue = Float(value)
        return self
    }
    
    func sliderMaxValue(_ value: CGFloat) -> UISlider {
        self.maximumValue = Float(value)
        return self
    }
    
    func sliderValue(_ value: CGFloat) -> UISlider {
        self.value = Float(value)
        return self
    }
    
    func sliderSetValue(_ value: CGFloat) -> UISlider {
        self.setValue(Float(value), animated: false)
        return self
    }
    
    func sliderSetValueWithAnimation(_ value: CGFloat) -> UISlider {
        self.setValue(Float(value), animated: true)
        return self
    }
    
    func sliderTargetSel(_ target: Any?,_ action: Selector,_ events: UIControlEvents) -> UISlider {
        self.addTarget(target, action: action, for: events)
        return self
    }
    
    func sliderMinTintColor(_ color: UIColor) -> UISlider {
        self.minimumTrackTintColor = color
        return self
    }
    
    func sliderMaxTintColor(_ color: UIColor) -> UISlider {
        self.maximumTrackTintColor = color
        return self
    }
    
    func sliderMinTintImage(_ image: UIImage) -> UISlider {
        self.setMinimumTrackImage(image, for: .normal)
        return self
    }
    
    func sliderMaxTintImage(_ image: UIImage) -> UISlider {
        self.setMaximumTrackImage(image, for: .normal)
        return self
    }

    func sliderThumbImage(_ image: UIImage) -> UISlider {
        self.setThumbImage(image, for: .normal)
        return self
    }
    
    func sliderLeftImage(_ image: UIImage) -> UISlider {
        self.minimumValueImage = image
        return self
    }
    
    func sliderRightImage(_ image: UIImage) -> UISlider {
        self.maximumValueImage = image
        return self
    }
    
}

