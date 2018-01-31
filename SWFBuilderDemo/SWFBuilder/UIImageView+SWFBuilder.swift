//
//  UIImageView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func ImageView() -> UIImageView {
    return UIImageView()
}

func ImageView(_ rect: CGRect) -> UIImageView {
    return UIImageView(frame: rect)
}

func ImageView(_ imageName: String) -> UIImageView {
    return UIImageView.init(image: UIImage(named: imageName))
}

func ImageView(_ image: UIImage) -> UIImageView {
    return UIImageView.init(image: image)
}

extension UIImageView
{
    
    func imgViewWithImage(image: UIImage) -> UIImageView {
        self.image = image
        return self
    }
    
    func imgViewWithMode(mode: UIViewContentMode) -> UIImageView {
        self.contentMode = mode
        return self
    }
    
    func imgViewWithImages(_ images: [UIImage], _ duration: TimeInterval) -> UIImageView {
        self.animationImages = images
        self.animationDuration = duration
        self.animationRepeatCount = 0
        self.startAnimating()
        return self;
    }
    
    func imgViewWithImages(_ images: [UIImage], _ duration: TimeInterval, _ repeatCount: Int) -> UIImageView {
        self.animationImages = images
        self.animationDuration = duration
        self.animationRepeatCount = repeatCount
        self.startAnimating()
        return self;
    }
    
}

