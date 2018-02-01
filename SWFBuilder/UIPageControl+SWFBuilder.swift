//
//  UITableView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func PageControl() -> UIPageControl {
    return UIPageControl()
}

func PageControl(_ rect: CGRect) -> UIPageControl {
    return UIPageControl(frame: rect)
}

extension UIPageControl
{
    
    func pageCtlNumPage(_ numPage: Int) -> UIPageControl {
        self.numberOfPages = numPage
        return self
    }
    
    func pageCtlCurrentPage(_ currentPage: Int) -> UIPageControl {
        self.currentPage = currentPage
        return self
    }
    
    func pageCtlHiddenForSingle(_ b: Bool) -> UIPageControl {
        self.hidesForSinglePage = b
        return self
    }
    
    func pageCtlIndicatorTintColor(_ color: UIColor) -> UIPageControl {
        self.pageIndicatorTintColor = color
        return self
    }
    
    func pageCtlCurrentPageTintColor(_ color: UIColor) -> UIPageControl {
        self.currentPageIndicatorTintColor = color
        return self
    }
    
    func pageCtl(_ target: Any?,_ action: Selector,_ events: UIControlEvents) -> UIPageControl {
        self.addTarget(target, action: action, for: events)
        return self
    }
    
}

