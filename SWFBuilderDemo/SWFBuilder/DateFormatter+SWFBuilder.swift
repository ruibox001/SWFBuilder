//
//  DateFormatter+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

extension DateFormatter
{
    func dateFormat(_ format: String) -> DateFormatter {
        self.dateFormat = format
        return self
    }
}

