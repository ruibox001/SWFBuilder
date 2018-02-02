//
//  UISegmentedControl+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func Segmented() -> UISegmentedControl {
    return UISegmentedControl()
}

func Segmented(_ rect: CGRect) -> UISegmentedControl {
    return UISegmentedControl(frame: rect)
}

func Segmented(_ items: [Any]?) -> UISegmentedControl {
    return UISegmentedControl(items: items)
}

extension UISegmentedControl
{
    
    func segmentedAddTitle(_ title: String?, _ at: Int, animated: Bool) -> UISegmentedControl {
        self.insertSegment(withTitle: title, at: at, animated: animated)
        return self
    }
    
    func segmentedAddImage(_ image: UIImage?, _ at: Int, animated: Bool) -> UISegmentedControl {
        self.insertSegment(with: image, at: at, animated: animated)
        return self
    }
    
    func segmentedRemove(_ at: Int, animated: Bool) -> UISegmentedControl {
        self.removeSegment(at: at, animated: animated)
        return self
    }
    
    func segmentedSetTitle(_ title: String?, _ at: Int) -> UISegmentedControl {
        self.setTitle(title, forSegmentAt: at)
        return self
    }
    
    func segmentedSetImage(_ image: UIImage?, _ at: Int) -> UISegmentedControl {
        self.setImage(image, forSegmentAt: at)
        return self
    }
    
    func segmentedSetWidth(_ w: CGFloat, _ at: Int) -> UISegmentedControl {
        self.setWidth(w, forSegmentAt: at)
        return self
    }
    
    func segmentedtintColor(_ color: UIColor) -> UISegmentedControl {
        self.tintColor = color
        return self
    }
    
    func segmentedCenter(_ center: CGPoint) -> UISegmentedControl {
        self.center = center
        return self
    }
    
    func segmentedSelectIndex(_ index: Int) -> UISegmentedControl {
        self.selectedSegmentIndex = index
        return self 
    }
    
    func segmentedTargetSel(_ target: Any?, _ action: Selector, _ event: UIControlEvents) -> UISegmentedControl {
        self.addTarget(target, action: action, for: event)
        return self
    }
    
    func segmentedTitleAt(_ at: Int) -> String? {
        return self.titleForSegment(at: at)
    }
    
    func segmentedImageAt(_ at: Int) -> UIImage? {
        return self.imageForSegment(at: at)
    }
    
    func segmentedSetEnableAt(_ enable: Bool, _ at: Int) -> UISegmentedControl {
        self.setEnabled(enable, forSegmentAt: at)
        return self
    }
    
    func segmentedEnableAt(_ at: Int) -> Bool {
        return self.isEnabledForSegment(at: at)
    }
    
    func segmentedContentOffset(_ size:CGSize, _ at: Int) -> UISegmentedControl {
        self.setContentOffset(size, forSegmentAt: at)
        return self
    }
    
    func segmentedContentOffsetAt(_ at: Int) -> CGSize {
        return self.contentOffsetForSegment(at: at)
    }
    
}

