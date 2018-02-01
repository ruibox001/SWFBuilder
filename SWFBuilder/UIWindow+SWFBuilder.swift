//
//  UITableView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func Window() -> UIWindow {
    return UIWindow()
}

func Window(_ rect: CGRect) -> UIWindow {
    return UIWindow(frame: rect)
}

extension UIWindow
{
    
    func windowKeyAndVisiable() -> UIWindow {
        self.becomeKey()
        self.makeKeyAndVisible()
        return self
    }
    
    func windowLevel(_ level: UIWindowLevel) -> UIWindow {
        self.windowLevel = level
        return self
    }
    
    func windowRootControlller(_ controller: UIViewController) -> UIWindow {
        self.rootViewController = controller
        return self
    }
    
    func windowIsShow(_ show: Bool) {
        if show {
            windowKeyAndVisiable().isHidden = false
        }
        else {
            self.resignKey()
            self.isHidden = true
        }
    }
    
}

