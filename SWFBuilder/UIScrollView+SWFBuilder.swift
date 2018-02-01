//
//  UIScrollView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func ScrollView() -> UIScrollView {
    return UIScrollView()
}

func ScrollView(_ rect: CGRect) -> UIScrollView {
    return UIScrollView(frame: rect)
}

extension UIScrollView
{
    
    func scrollViewContentSize(_ size: CGSize) -> UIScrollView {
        self.contentSize = size
        return self
    }
    
    func scrollViewPaging(_ b: Bool) -> UIScrollView {
        self.isPagingEnabled = b
        return self
    }
    
    func scrollViewShowsHorizontal(_ b: Bool) -> UIScrollView {
        self.showsHorizontalScrollIndicator = b
        return self
    }
    
    func scrollViewShowsVertical(_ b: Bool) -> UIScrollView {
        self.showsVerticalScrollIndicator = b
        return self
    }
    
    func scrollViewBounces(_ b: Bool) -> UIScrollView {
        self.bounces = b
        return self
    }
    
    func scrollViewBounceHorizontal(_ b: Bool) -> UIScrollView {
        self.alwaysBounceHorizontal = b
        return self
    }
    
    func scrollViewBounceVertical(_ b: Bool) -> UIScrollView {
        self.alwaysBounceVertical = b
        return self
    }
    
    func scrollViewEnable(_ b: Bool) -> UIScrollView {
        self.isScrollEnabled = b
        return self
    }
    
    func scrollViewContentInset(_ inset: UIEdgeInsets) -> UIScrollView {
        self.contentInset = inset
        return self
    }
    
    func scrollViewScollIndicatorInset(_ inset: UIEdgeInsets) -> UIScrollView {
        self.scrollIndicatorInsets = inset
        return self
    }
    
    func scrollViewIndicatorStyle(_ style: UIScrollViewIndicatorStyle) -> UIScrollView {
        self.indicatorStyle = style
        return self
    }
    
    func scrollViewMinScale(_ scale: CGFloat) -> UIScrollView {
        self.minimumZoomScale = scale
        return self
    }
    
    func scrollViewMaxScale(_ scale: CGFloat) -> UIScrollView {
        self.maximumZoomScale = scale
        return self
    }
    
    func scrollViewDelegate(_ delegate: UIScrollViewDelegate?) -> UIScrollView {
        self.delegate = delegate
        return self
    }
    
    func scrollViewDirectionLockEnable(_ b: Bool) -> UIScrollView {
        self.isDirectionalLockEnabled = b
        return self
    }
    
    func scrollViewSetContentOffset(_ p: CGPoint, animated ani: Bool) -> UIScrollView {
        self.setContentOffset(p, animated: ani)
        return self
    }
    
    func scrollViewRate(_ rate: CGFloat) -> UIScrollView {
        self.decelerationRate = rate
        return self
    }
    
    func scrollViewToTop() -> UIScrollView {
        self.scrollsToTop = true
        return self
    }
    
}

