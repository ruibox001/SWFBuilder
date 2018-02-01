//
//  SFUtils.swift
//  TestSwift
//
//  Created by wsy on 2018/1/17.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    private static let runOnce:Void = {
        InitSelfLoadProtocol()
        SWFBuilderPublicInit()
    }()
    
    open override var next: UIResponder? {
        UIApplication.runOnce
        return super.next
    }
    
}

