//
//  WKWebView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import JavaScriptCore

extension WKUserContentController
{
    
    /****************<Js>****************/
    private var js: JsMethodControl? {
        get {
            return objc_getAssociatedObject(self, &JsMethodControl.Key) as? JsMethodControl
        }
        set {
            if let newValue = newValue  {
                objc_setAssociatedObject(self, &JsMethodControl.Key, newValue as JsMethodControl?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    private func jsControl(_ uController: WKUserContentController) -> JsMethodControl {
        if self.js == nil {
            self.js = JsMethodControl(uController);
        }
        return self.js!;
    }
    
    func userContentControllerAddJsMethod(_ name: String, _ block: JsMethodModel.JSBlock? ) {
        jsControl(self).addJs(name, handler: block)
    }
    
    func userContentControllerRemoveAllJsHandle() {
        jsControl(self).removeAllMethods()
    }
    
}


public class JsMethodControl : NSObject, WKScriptMessageHandler {
    
    public static var Key = "JsMethodControlKey";
    
    private var uController: WKUserContentController?
    
    private lazy var methods: NSMutableArray = {
        let m = NSMutableArray()
        return m
    }()
    
    init(_ uController: WKUserContentController) {
        self.uController = uController
    }
    
    func addJs(_ name: String, handler: JsMethodModel.JSBlock?) {
        let m = JsMethodModel.init(name, handler)
        self.methods.add(m)
        self.uController?.add(self, name: name)
    }
    
    func removeAllMethods() {
        for  m in self.methods {
            let model: JsMethodModel = m as! JsMethodModel
            self.uController?.removeScriptMessageHandler(forName: model.methodName!)
        }
        self.methods.removeAllObjects()
    }
    
    //代理方法
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        let name: String? = message.name
        if name == nil || name?.count == 0 {
            return
        }
        
        for  m in self.methods {
            let model: JsMethodModel = m as! JsMethodModel
            if model.methodName == name {
                if model.methodBlock != nil {
                    model.methodBlock!(message.body)
                }
                return
            }
        }
        
    }
    
}

//Js调用原生模型
public class JsMethodModel {
    public typealias JSBlock = ((_ any: Any)->Void)
    var methodName: String?
    var methodBlock: JSBlock?
    
    init(_ name: String?, _ block: JSBlock?) {
        self.methodName = name
        self.methodBlock = block
    }
}
