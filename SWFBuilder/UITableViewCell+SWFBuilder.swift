//
//  UITableView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func TableVCell(_ identity: String?) -> UITableViewCell {
    return UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identity)
}

func TableVCell(_ style: UITableViewCellStyle, _ identity: String?) -> UITableViewCell {
    return UITableViewCell.init(style: style, reuseIdentifier: identity)
}

extension UITableViewCell
{
    
    func tableViewCellAccessoryType(_ type: UITableViewCellAccessoryType) -> UITableViewCell {
        self.accessoryType = type
        return self
    }
    
    func tableViewCellAccessoryView(_ view: UIView) -> UITableViewCell {
        self.accessoryView = view
        return self
    }
    
    func tableViewCellBgView(_ view: UIView) -> UITableViewCell {
        self.backgroundView = view
        return self
    }
    
    func tableViewCellSeparatorInset(_ inset: UIEdgeInsets) -> UITableViewCell {
        if self.responds(to:#selector(setter: UIView.layoutMargins)) {
            self.layoutMargins = inset
        }
        if self.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            self.separatorInset = inset
        }
        return self
    }
    
    func tableViewCellSeparatorInsetZero(_ inset: UIEdgeInsets) -> UITableViewCell {
        return tableViewCellSeparatorInset(UIEdgeInsets.zero)
    }
    
}

