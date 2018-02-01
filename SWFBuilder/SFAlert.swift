//
//  SFAlertBulder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/17.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func Alert() -> SFAlert {
   return SFAlert(style: .alert)
}

func Sheet() -> SFAlert {
    return SFAlert(style: .actionSheet)
}

class SFAlert {
    
    private var title: String?
    private var message: String?
    private var style: UIAlertControllerStyle?
    
    private lazy var actions: NSMutableArray = {
        let acs = NSMutableArray()
        return acs;
    }()
    
    init(style: UIAlertControllerStyle) {
        self.style = style
    }
    
    public func setTitle(_ title: String) -> SFAlert{
        self.title = title;
        return self;
    }
    
    public func setMsg(_ msg: String) -> SFAlert{
        self.message = msg;
        return self;
    }
    
    public func addAction(name: String, style: UIAlertActionStyle, click: ((_ action: UIAlertAction)->Void)? ) -> SFAlert{
        let ac: UIAlertAction = UIAlertAction.init(title: name, style: style, handler: click)
        self.actions.add(ac)
        return self;
    }
    
    public func show(_ viewController: UIViewController){
        var ty = UIAlertControllerStyle.alert
        if self.style != nil {
            ty = self.style!
        }
        let alert: UIAlertController = UIAlertController.init(title: self.title, message: self.message, preferredStyle: ty)
        for ac in self.actions {
            alert.addAction(ac as! UIAlertAction)
        }
        viewController.present(alert, animated: true, completion: nil)
    }
    
    public func show() {
        let viewController: UIViewController = getVisibleViewController()
        show(viewController)
    }
    
}
