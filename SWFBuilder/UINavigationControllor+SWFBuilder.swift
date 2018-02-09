//
//  UINavigationControllor+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController
{
    
    open static func initializes() {
        self.objSwizzlingOrReplaceMethod(originSelector: #selector(pushViewController(_:animated:)), newSelector: #selector(cus_pushViewController(_:animated:)))
    }
    
    @objc func cus_pushViewController(_ viewController: UIViewController, animated: Bool){
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true //这个方便隐藏导航栏
            self.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate //左滑返回手势
        }
        self.cus_pushViewController(viewController, animated: animated)
    }
    
    func naviBgImage(_ image: UIImage) -> UINavigationController {
        self.navigationBar .setBackgroundImage(image, for: UIBarMetrics.default)
        return self
    }
    
    func naviBgColor(_ color: UIColor) -> UINavigationController {
        let image = color.colorImage()
        self.navigationBar .setBackgroundImage(image, for: UIBarMetrics.default)
        return self
    }
    
}

