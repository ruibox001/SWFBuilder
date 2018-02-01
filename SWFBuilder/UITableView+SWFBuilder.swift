//
//  UITableView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func TableView() -> UITableView {
    return UITableView.init(frame: makeRect(0, 0, 0, 0), style: UITableViewStyle.plain)
}

func TableView(_ rect: CGRect) -> UITableView {
    return UITableView.init(frame: rect, style: UITableViewStyle.plain)
}

func TableView(_ style: UITableViewStyle) -> UITableView {
    return UITableView.init(frame: makeRect(0, 0, 0, 0), style: style)
}
func TableView(_ rect: CGRect, _ style: UITableViewStyle) -> UITableView {
    return UITableView.init(frame: rect, style: style)
}

extension UITableView
{
    
    func tableViewReusableCell(_ id: String) -> UITableViewCell {
        var cell: UITableViewCell? = self.dequeueReusableCell(withIdentifier: id)
        if cell == nil {
            cell = TableVCell(id)
        }
        return cell!
    }
    
    func tableViewReusableCell(_ style: UITableViewCellStyle, _ id: String) -> UITableViewCell {
        var cell: UITableViewCell? = self.dequeueReusableCell(withIdentifier: id)
        if cell == nil {
            cell = TableVCell(style, id)
        }
        return cell!
    }
    
    func tableViewRowHeight(_ height: CGFloat) -> UITableView {
        self.rowHeight = height
        return self
    }
    
    func tableViewHeaderHeight(_ height: CGFloat) -> UITableView {
        self.sectionHeaderHeight = height
        return self
    }
    
    func tableViewFooterHeight(_ height: CGFloat) -> UITableView {
        self.sectionFooterHeight = height
        return self
    }
    
    func tableViewEstimatedRowHeight(_ height: CGFloat) -> UITableView {
        self.estimatedRowHeight = height
        return self
    }
    
    func tableViewEstimatedHeaderHeight(_ height: CGFloat) -> UITableView {
        self.estimatedSectionHeaderHeight = height
        return self
    }
    
    func tableViewEstimatedFooterHeight(_ height: CGFloat) -> UITableView {
        self.estimatedSectionFooterHeight = height
        return self
    }
    
    func tableViewSeperatorInset(_ insets: UIEdgeInsets) -> UITableView {
        self.separatorInset = insets
        return self
    }
    
    func tableViewDelegate(_ delegate: UITableViewDelegate?) -> UITableView {
        self.delegate = delegate
        return self
    }
    
    func tableViewDataSource(_ dataSource: UITableViewDataSource?) -> UITableView {
        self.dataSource = dataSource
        return self
    }
    
    func tableViewHeaderView(_ view: UIView?) -> UITableView {
        self.tableHeaderView = view
        return self
    }
    
    func tableViewSeparatorStyle(_ style: UITableViewCellSeparatorStyle) -> UITableView {
        self.separatorStyle = style
        return self
    }
    
    func tableViewFooterView(_ view: UIView?) -> UITableView {
        self.tableFooterView = view
        return self
    }
    
    func tableViewReload(_ indexPath: IndexPath) -> UITableView {
        self.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
        return self
    }
    
    
}

