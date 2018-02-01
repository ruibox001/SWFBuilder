//
//  UITableView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func SearchBar() -> UISearchBar{
    return UISearchBar()
}

func SearchBar(_ rect: CGRect) -> UISearchBar{
    return UISearchBar(frame: rect)
}

extension UISearchBar
{
    
    func SearchBarTintColor(_ color: UIColor) -> UISearchBar{
        self.tintColor = color
        return self
    }
    
    func SearchBarBarTintColor(_ color: UIColor) -> UISearchBar{
        self.barTintColor = color
        return self
    }
    
    func SearchBarDelegate(_ delegate: UISearchBarDelegate?) -> UISearchBar{
        self.delegate = delegate
        return self
    }
    
    func SearchBarBarStyle(_ barStyle: UIBarStyle) -> UISearchBar{
        self.barStyle = barStyle
        return self
    }
    
    func SearchBarSearchBarStyle(_ style: UISearchBarStyle) -> UISearchBar{
        self.searchBarStyle = style
        return self
    }
    
    func SearchBarPlaceholder(_ placeholder: String?) -> UISearchBar{
        self.placeholder = placeholder
        return self
    }
    
    func SearchBarShowCancelBtn(_ shows: Bool) -> UISearchBar{
        self.showsCancelButton = shows
        return self
    }
    
    func SearchBarShowBookBtn(_ shows: Bool) -> UISearchBar{
        self.showsBookmarkButton = shows
        return self
    }
    
}

