//
//  UITableView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func PickerView() -> UIPickerView {
    return UIPickerView()
}

func PickerView(_ rect: CGRect) -> UIPickerView {
    return UIPickerView(frame: rect)
}

extension UIPickerView
{
    
    func pickerViewDelegate(_ delegate: UIPickerViewDelegate?) -> UIPickerView {
        self.delegate = delegate
        return self
    }
    
    func pickerViewDataSource(_ dataSource: UIPickerViewDataSource?) -> UIPickerView {
        self.dataSource = dataSource
        return self
    }
    
    
}

