//
//  UIViewController+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

//配置默认项
let navigationBackImage = DF_NavigationBackImageName
let navigationFontSize: CGFloat = DF_NavigationTitleFontSize
let navigationLeftRightFontSize: CGFloat = DF_NavigationLeftRightFontSize
let navigationdefaultColor = DF_NavigationLeftRightLabelColor


public typealias DViewClickblock = ((_ v: UIView)->Void)?

public class NavTool: NSObject {
    
    lazy var blocks: NSMutableDictionary = {
        let tempBlocks = NSMutableDictionary()
        return tempBlocks;
    }()
    
    lazy var titleLabel: UILabel = {
        let tempLabel = UILabel(frame:CGRect(x:0,y:0,width:80,height:44))
        tempLabel.backgroundColor = UIColor.clear
        tempLabel.textAlignment = NSTextAlignment.center
        tempLabel.textColor = navigationdefaultColor
        tempLabel.font = UIFont.systemFont(ofSize: navigationFontSize)
        return tempLabel;
    }()
    
    @objc private func clickBtn(_ obj: UIButton) {
        let block = self.blocks.value(forKey: getObjectKey(obj))
        if block != nil {
            let v: UIView = obj
            let b:DViewClickblock = block as! DViewClickblock;
            b!(v)
        }
    }
    
    private func getObjectKey(_ obj: AnyObject) -> String{
        let i = ObjectIdentifier(obj).hashValue
        return String(i)
    }
    
    private func getButton(_ edg: UIEdgeInsets, _ titOrImg: AnyObject?, _ titleColor: UIColor?) -> UIButton {
        let button: UIButton = UIButton(type: .custom)
        button.frame = CGRect(x:0,y:0,width:44,height:44)
        button.tag = 0
        button.addTarget(self, action: #selector(clickBtn(_:)), for:.touchUpInside)
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.backgroundColor = UIColor.clear
        button.titleLabel?.font = UIFont.systemFont(ofSize: navigationLeftRightFontSize)
        button.setTitleColor(titleColor, for: .normal)
        
        if titOrImg is String {
            button.titleEdgeInsets = edg
            button.setTitle(titOrImg as? String, for: .normal)
        }
        else if titOrImg is UIImage {
            button.imageEdgeInsets = edg
            button.setImage(titOrImg as? UIImage, for: .normal)
        }
        return button
    }
    
    private func getItem(_ titleOrImage: AnyObject?,tag: NSInteger, left: Bool, tintColor: UIColor, clickBlock: DViewClickblock ) -> UIBarButtonItem {
        let item: UIBarButtonItem = UIBarButtonItem()
        item.tintColor = tintColor

        var insert: UIEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20)
        if left {
            insert = UIEdgeInsetsMake(0, -20, 0, 0)
        }
        let button: UIButton = getButton(insert, titleOrImage, tintColor)
        button.tag = tag;
        item.customView = button
        if clickBlock != nil {
            self.blocks.setValue(clickBlock, forKey: getObjectKey(button))
        }
        return item;
    }
    
    private func setitems(_ array: NSArray, left: Bool, ctrl: UIViewController, tintColor: UIColor?, cilckBlock:DViewClickblock ) {
        let mArray: NSMutableArray = NSMutableArray()
        for i in 0...(array.count-1){
            let any: AnyObject = array[i] as AnyObject
            var tColor: UIColor? = tintColor;
            if tintColor == nil {
                tColor = navigationdefaultColor
            }
            let item: UIBarButtonItem = getItem(any, tag: i, left: left, tintColor: tColor!, clickBlock:cilckBlock)
            mArray.add(item)
        }
        
        if left {
            ctrl.navigationItem.leftBarButtonItems = mArray as? [UIBarButtonItem];
        }
        else {
            ctrl.navigationItem.rightBarButtonItems = mArray as? [UIBarButtonItem]
        }
    }
    
    public func addTitle(_ v: UIViewController, _ tit: String, tinColor color: UIColor?) {
        if v.navigationItem.titleView == nil || !v.navigationItem.titleView!.isEqual(self.titleLabel) {
            v.navigationItem.titleView = self.titleLabel;
        }
        
        if color != nil {
            self.titleLabel.textColor = color;
        }
        self.titleLabel.text = tit;
    }
    
    public func addLeft(_ v: UIViewController, _ left: AnyObject?, tinColor color: UIColor?,_ block:DViewClickblock ){
        if left == nil {
            let image: UIImage? = UIImage(named:navigationBackImage);
            var tColor: UIColor? = color;
            if color == nil {
                tColor = navigationdefaultColor
            }
            let item: UIBarButtonItem? = getItem(image, tag: 0, left: true, tintColor: tColor!, clickBlock:block)
            v.navigationItem.leftBarButtonItem = item
            return;
        }
        
        var tintColor: UIColor = navigationdefaultColor
        if color != nil {
            tintColor = color!
        }
        
        if left is NSArray? {
            let array: NSArray = left as! NSArray
            setitems(array, left: true, ctrl: v, tintColor: color, cilckBlock: block)
        }
        else {
            v.navigationItem.leftBarButtonItem = getItem(left, tag: 0, left: true, tintColor: tintColor, clickBlock:block)
        }
    }
    
    public func addRight(_ v: UIViewController, _ right: AnyObject?, tinColor color: UIColor?,_ block:DViewClickblock){
        if right == nil {
            return;
        }
        
        var tintColor: UIColor = navigationdefaultColor
        if color != nil {
            tintColor = color!
        }
        
        if right is NSArray? {
            let array: NSArray = right as! NSArray
            setitems(array, left: false, ctrl: v, tintColor: color, cilckBlock: block)
        }
        else {
            v.navigationItem.rightBarButtonItem = getItem(right, tag: 0, left: false, tintColor: tintColor, clickBlock:block)
        }
    }
}

extension UIViewController
{
    private struct AssociateKeys {
        static var navToolKey = "navToolKey";
    }
    
    private var navTool: NavTool? {
        get {
            return objc_getAssociatedObject(self, &AssociateKeys.navToolKey) as? NavTool
        }
        set {
            if let newValue = newValue  {
                objc_setAssociatedObject(self, &AssociateKeys.navToolKey, newValue as NavTool?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    private func getTool() -> NavTool {
        if self.navTool == nil {
            self.navTool = NavTool();
        }
        return self.navTool!;
    }
    
    private func getImage(color:UIColor) -> UIImage{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    public func isPush()->Bool {
        let views: NSArray = (self.navigationController?.viewControllers)! as NSArray
        let count: Int = (views.count)
        if (count > 1) {
            let v: Any = views.object(at: (count - 1))
            if self.isEqual(v) {
                return true
            }
        }
        return false
    }
    
    public func back() {
        self.view.endEditing(true)
        if self.isPush() {
            self.navigationController?.popViewController(animated: true)
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    public func addTitle(title: String) {
        if title.isEmpty {
            return;
        }
        getTool().addTitle(self,title,tinColor: nil)
    }
    
    public func addTitle(title: String, tinColor color: UIColor) {
        getTool().addTitle(self,title, tinColor: color)
    }
    
    
    public func addLeft(anyObject: AnyObject?, block:DViewClickblock ){
        if block == nil {
            let block:DViewClickblock = { [weak self] (v: UIView) in
                self?.back()
            }
            getTool().addLeft(self, anyObject, tinColor: nil,block)
            return;
        }
        getTool().addLeft(self, anyObject, tinColor: nil,block)
    }

    public func addLeft(anyObject: AnyObject?, tintColor color: UIColor?,block:DViewClickblock ){
        getTool().addLeft(self, anyObject, tinColor: color,block)
    }


    public func addRight(anyObject: AnyObject?,block:DViewClickblock){
        getTool().addRight(self, anyObject, tinColor: nil, block)
    }

    public func addRight(anyObject: AnyObject?, tintColor color: UIColor?,block:DViewClickblock){
        getTool().addRight(self, anyObject, tinColor: color, block)
    }
    
    public func setNavigation(hidden:Bool, animated:Bool){
        self.navigationController?.setNavigationBarHidden(hidden, animated: animated)
    }
    
    public func setNavigationBg(bgColor:UIColor){
        self.navigationController?.navigationBar.setBackgroundImage(getImage(color: bgColor), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
    }
    
    public func setNavigationBgImage(imageNamed:String){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:imageNamed), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
    }
    
    //⚠️在info.plist中添加如下配置 View controller-based status bar appearance = NO
    public func setStatusBar(style:UIStatusBarStyle){
        UIApplication.shared.statusBarStyle = style
    }
    
}

