//
//  UIView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func View() -> UIView {
    return UIView()
}

func View(_ rect: CGRect) -> UIView {
    return UIView(frame: rect)
}

extension UIView
{
    
    func viewIsHidden(_ hidden: Bool) -> UIView {
        self.isHidden = hidden
        return self
    }
    
    func viewIsUserEnable(_ enable: Bool) -> UIView {
        self.isUserInteractionEnabled = enable
        return self
    }
    
    func viewTag(_ tag: Int) -> UIView {
        self.tag = tag
        return self
    }
    
    func viewBgColor(_ color: UIColor) -> UIView {
        self.backgroundColor = color
        return self
    }
    
    func viewContentMode(_ mode: UIViewContentMode) -> UIView {
        self.contentMode = mode
        return self
    }
    
    func viewIntoView(_ view: UIView) -> UIView {
        view.addSubview(self)
        return self
    }
    
    func viewRemoveFromSuperView() -> UIView {
        self.removeFromSuperview()
        return self
    }
    
    func viewBringToFont(_ view: UIView) -> UIView {
        self.bringSubview(toFront: view)
        return self
    }
    
    func viewFrame(_ frame: CGRect) -> UIView {
        self.frame = frame
        return self
    }
    
    func viewCircle(_ borderW: CGFloat, _ radius: CGFloat, _ color: UIColor) -> UIView {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderW
        self.layer.borderColor = color.cgColor
        return self
    }
    
    func viewClick(_ target: Any?, _ action: Selector?) -> UIView {
        let ges: UITapGestureRecognizer = UITapGestureRecognizer.init(target: target, action: action)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(ges)
        return self
    }
    
    func viewLongClick(_ target: Any?, _ action: Selector?) -> UIView {
        let ges = UILongPressGestureRecognizer.init(target: target, action: action)
        ges.minimumPressDuration = 0.5
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(ges)
        return self
    }
    
    func viewSnapshotToImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func viewRemoveAllSubViews() -> UIView {
        while self.subviews.count > 0 {
            self.subviews.last?.removeFromSuperview()
        }
        return self
    }
    
    func viewXYWH(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) -> UIView {
        self.frame = CGRect.init(x: x, y: y, width: w, height: h)
        return self
    }
    
    func viewRect(_ rect: CGRect) -> UIView {
        self.frame = rect
        return self
    }
    
    func viewShadow(_ color: UIColor, _ offset: CGSize, _ radius: CGFloat) -> UIView {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = 1
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        return self
    }
   
    func viewConverPoint(_ point: CGPoint, toView view: UIView?) -> CGPoint {
        
        var from: UIWindow? = self.window
        if self is UIWindow {
            from = self as? UIWindow
        }
        
        var to: UIWindow? = view?.window
        if view is UIWindow {
            to = view as? UIWindow
        }
        
        if ( (from == nil || to == nil) || (from == to)) {
            return self.convert(point, to: view)
        }
        
        var p = self.convert(point, to: from)
        p = (to?.convert(p, from: from))!
        p = (view?.convert(p, from: to))!
        return p
    }
    
    func viewConverPoint(_ point: CGPoint, fromView view: UIView?) -> CGPoint {
        
        var from: UIWindow? = view?.window
        if view is UIWindow {
            from = view as? UIWindow
        }
        
        var to: UIWindow? = self.window
        if self is UIWindow {
            to = self as? UIWindow
        }
        
        if ( (from == nil || to == nil) || (from == to)) {
            return self.convert(point, from: view)
        }
        
        var p = from?.convert(point, from: view)
        p = (to?.convert(p!, from: from))!
        p = (self.convert(p!, from: to))
        return p!
    }
    
    func viewConverRect(_ rect: CGRect, toView view: UIView?) -> CGRect {
        
        var from: UIWindow? = self.window
        if self is UIWindow {
            from = self as? UIWindow
        }
        
        var to: UIWindow? = view?.window
        if view is UIWindow {
            to = view as? UIWindow
        }
        
        if ( (from == nil || to == nil) || (from == to) ) {
            return self.convert(rect, to: view)
        }
        
        var r = self.convert(rect, to: from)
        r = (to?.convert(r, from: from))!
        r = (view?.convert(r, from: to))!
        return r
    }
    
    func viewConverRect(_ rect: CGRect, fromView view: UIView?) -> CGRect {
        
        var from: UIWindow? = view?.window
        if view is UIWindow {
            from = view as? UIWindow
        }
        
        var to: UIWindow? = self.window
        if self is UIWindow {
            to = self as? UIWindow
        }
        
        if ( (from == nil || to == nil) || (from == to)) {
            return self.convert(rect, from: view)
        }
        
        var r = from?.convert(rect, from: view)
        r = (to?.convert(r!, from: from))!
        r = (self.convert(r!, from: to))
        return r!
    }
    
    func viewScaleX(_ x: CGFloat) -> UIView {
        self.layer.setAffineTransform(CGAffineTransform.init(scaleX: x, y: 1))
        return self
    }
    
    func viewScaleX(_ x: CGFloat, animation duration: TimeInterval) -> UIView {
        UIView.animate(withDuration: duration) {
            self.layer.setAffineTransform(CGAffineTransform.init(scaleX: x, y: 1))
        }
        return self
    }
    
    func viewScaleY(_ y: CGFloat) -> UIView {
        self.layer.setAffineTransform(CGAffineTransform.init(scaleX: 1, y: y))
        return self
    }
    
    func viewScaleY(_ y: CGFloat, animation duration: TimeInterval) -> UIView {
        UIView.animate(withDuration: duration) {
            self.layer.setAffineTransform(CGAffineTransform.init(scaleX: 1, y: y))
        }
        return self
    }
    
    func viewScale(_ point: CGPoint) -> UIView {
        self.layer.setAffineTransform(CGAffineTransform.init(scaleX: point.x, y: point.y))
        return self
    }
    
    func viewScale(_ point: CGPoint, animation duration: TimeInterval) -> UIView {
        UIView.animate(withDuration: duration) {
            self.layer.setAffineTransform(CGAffineTransform.init(scaleX: point.x, y: point.y))
        }
        return self
    }
    
    func viewRotation(_ angle: CGFloat) -> UIView {
        self.layer.setAffineTransform(CGAffineTransform.init(rotationAngle: angle))
        return self
    }
    
    func viewRotation(_ angle: CGFloat, animation duration: TimeInterval) -> UIView {
        UIView.animate(withDuration: duration) {
            self.layer.setAffineTransform(CGAffineTransform.init(rotationAngle: angle))
        }
        return self
    }
    
    func viewAnimation(animation duration: TimeInterval, _ block: @escaping ()->Void) -> UIView {
        UIView.animate(withDuration: duration, animations: block)
        return self
    }
    
    /*------------------------------------------------------------------------------*/
    
    func left() -> CGFloat {
        return self.frame.origin.x
    }
    
    func setLeft(_ x: CGFloat) -> UIView {
        var frame: CGRect = self.frame
        frame.origin.x = x
        self.frame = frame
        return self
    }
    
    func right() -> CGFloat {
        let r = self.frame.origin.x + self.frame.size.width
        return r
    }
    
    func setRight(_ right: CGFloat) -> UIView {
        var frame: CGRect = self.frame
        frame.origin.x = right - frame.size.width
        self.frame = frame
        return self
    }
    
    func top() -> CGFloat {
        return self.frame.origin.y
    }
    
    func setTop(_ y: CGFloat) -> UIView {
        var frame: CGRect = self.frame
        frame.origin.y = y
        self.frame = frame
        return self
    }
    
    func bottom() -> CGFloat {
        let b = self.frame.origin.y + self.frame.size.height
        return b
    }
    
    func setBottom(_ bottom: CGFloat) -> UIView {
        var frame: CGRect = self.frame
        frame.origin.y = bottom - frame.size.height
        self.frame = frame
        return self
    }
    
    func width() -> CGFloat {
        return self.frame.size.width
    }
    
    func setWidth(_ width: CGFloat) -> UIView {
        var frame: CGRect = self.frame
        frame.size.width = width
        self.frame = frame
        return self
    }
    
    func height() -> CGFloat {
        return self.frame.size.height
    }
    
    func setHeight(_ height: CGFloat) -> UIView {
        var frame: CGRect = self.frame
        frame.size.height = height
        self.frame = frame
        return self
    }
    
    func centerX() -> CGFloat {
        return self.center.x
    }
    
    func setCenterX(_ centerX: CGFloat) -> UIView {
        self.center = CGPoint.init(x: centerX, y: self.center.y)
        return self
    }
    
    func centerY() -> CGFloat {
        return self.center.y
    }
    
    func setCenterY(_ centerY: CGFloat) -> UIView {
        self.center = CGPoint.init(x: self.center.x, y: centerY)
        return self
    }
    
    func origin() -> CGPoint {
        return self.frame.origin
    }
    
    func setOrigin(_ origin: CGPoint) -> UIView {
        var frame: CGRect = self.frame
        frame.origin = origin
        self.frame = frame
        return self
    }
    
    func size() -> CGSize {
        return self.frame.size
    }
    
    func setSize(_ size: CGSize) -> UIView {
        var frame: CGRect = self.frame
        frame.size = size
        self.frame = frame
        return self
    }
    
}

