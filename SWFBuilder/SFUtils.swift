//
//  SFUtils.swift
//  TestSwift
//
//  Created by wsy on 2018/1/17.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

class SFUtils {

    class func getVisibleViewController(viewController: UIViewController) -> UIViewController {
        if viewController is UINavigationController {
            let navi: UINavigationController = viewController as! UINavigationController
            let last: UIViewController = navi.viewControllers.last!
            return getVisibleViewController(viewController: last)
        }
        
        if viewController is UITabBarController {
            let tab: UITabBarController = viewController as! UITabBarController
            let last: UIViewController = tab.selectedViewController!
            return getVisibleViewController(viewController: last)
        }
        
        if viewController.presentedViewController != nil {
            let v: UIViewController = viewController.presentedViewController!
            return getVisibleViewController(viewController: v)
        }
        
        return viewController;
    }

}
    

