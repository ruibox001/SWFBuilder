//
//  UITableView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func IndicatorViewInit() -> UIActivityIndicatorView {
    return UIActivityIndicatorView(frame: UIScreen.main.bounds)
}

func IndicatorViewInit(_ rect: CGRect) -> UIActivityIndicatorView {
    return UIActivityIndicatorView(frame: rect)
}

func IndicatorViewShow(_ style: UIActivityIndicatorViewStyle) -> UIActivityIndicatorView {
    let i = IndicatorViewInit().indicatorStyle(style).indicatorToView(nil).indicatorStartAnimation().indicatorColor(UIColor.red)
    return (i.viewBgColor(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2)) as! UIActivityIndicatorView)
}

func IndicatorViewShow(_ color: UIColor) -> UIActivityIndicatorView {
    let i = IndicatorViewInit().indicatorToView(nil).indicatorStartAnimation().indicatorColor(color)
    return (i.viewBgColor(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2)) as! UIActivityIndicatorView)
}

func IndicatorViewShow(_ color: UIColor, _ bgColor: UIColor) -> UIActivityIndicatorView {
    let i = IndicatorViewInit().indicatorToView(nil).indicatorStartAnimation().indicatorColor(color)
    return (i.viewBgColor(bgColor) as! UIActivityIndicatorView)
}

func IndicatorViewShow(_ color: UIColor, afterDismiss sec: TimeInterval) -> UIActivityIndicatorView {
    let i = IndicatorViewInit().indicatorToView(nil).indicatorStartAnimation().indicatorColor(color)
    DoInMainAfter(sec) {
        i.indicatorStopAnimation()
    }
    return (i.viewBgColor(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2)) as! UIActivityIndicatorView)
}

func IndicatorViewShow(_ color: UIColor, _ bgColor: UIColor, afterDismiss sec: TimeInterval) -> UIActivityIndicatorView {
    let i = IndicatorViewInit().indicatorToView(nil).indicatorStartAnimation().indicatorColor(color)
    DoInMainAfter(sec) {
        i.indicatorStopAnimation()
    }
    return (i.viewBgColor(bgColor) as! UIActivityIndicatorView)
}

extension UIActivityIndicatorView {
    
    func indicatorStyle(_ style: UIActivityIndicatorViewStyle) -> UIActivityIndicatorView {
        self.activityIndicatorViewStyle = style
        return self
    }
    
    func indicatorColor(_ color: UIColor) -> UIActivityIndicatorView {
        self.color = color
        return self
    }
    
    func indicatorStartAnimation() -> UIActivityIndicatorView {
        self.startAnimating()
        return self
    }
    
    func indicatorStopAnimation() {
        self.stopAnimating()
    }
    
    func indicatorToView(_ view: UIView?) -> UIActivityIndicatorView {
        if view == nil {
            UIApplication.shared.keyWindow?.addSubview(self)
        }
        else {
            view?.addSubview(self)
        }
        return self
    }
    
}


