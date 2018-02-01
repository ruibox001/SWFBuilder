//
//  ViewController.swift
//  SWFBuilderDemo
//
//  Created by wsy on 2018/1/31.
//  Copyright © 2018年 liangweifeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Label(makeRect(100, 100, 200, 30))
            .labelFont(fnt(14))
            .labelText("我的内容")
            .labelAlign(NSTextAlignment.center)
            .labelColor(UIColor.red)
            .viewIntoView(self.view)
        
    }

}

