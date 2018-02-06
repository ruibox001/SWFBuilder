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

func WKWeb(_ rect: CGRect) -> WKWebView {
    return WKWebView(frame: rect)
}

func WKWeb(_ rect: CGRect, _ config: WKWebViewConfiguration) -> WKWebView {
    return WKWebView(frame: rect, configuration: config)
}

extension WKWebView
{
    
    func wkWebDelegate(_ uiDelegate: WKUIDelegate?) -> WKWebView {
        self.uiDelegate = uiDelegate
        return self
    }
    
    func wkWebNaviDelegate(_ navigationDelegate: WKNavigationDelegate?) -> WKWebView {
        self.navigationDelegate = navigationDelegate
        return self
    }
    
    func wkWebLoadHtmlString(_ htmlString: String) -> WKWebView {
        self.loadHTMLString(htmlString, baseURL: nil)
        return self
    }
    
    func wkWebLoadRequest(_ request: URLRequest) -> WKWebView {
        self.load(request)
        return self
    }
    
    func wkWebLoadUrlStr(_ url: String) -> WKWebView {
        return self.wkWebLoadRequest(url.strToRequest()!)
    }
    
    func wkWebLoadUrl(_ url: URL) -> WKWebView {
        return self.wkWebLoadRequest(URLRequest(url: url))
    }
    
    func wkWebJSContext() -> JSContext? {
        return self.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext
    }
    
    func wkWebRunJs(_ js: String) {
        self.evaluateJavaScript(js, completionHandler: nil)
    }
    
    func wkWebRunJs(_ js: String, completionHandlerBlock: @escaping (_ any: Any?, _ err: Error?)->Void ) {
        self.evaluateJavaScript(js, completionHandler: completionHandlerBlock)
    }
    
    func wkWebRemoveAllCacheData(finishBlock: @escaping ()->Void) {
        WKWebsiteDataStore.default().removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: Date.init(timeIntervalSince1970: 0), completionHandler: finishBlock)
    }
    
    
    /****************<进度和Title>****************/
    private var wProgress: WebViewProgress? {
        get {
            return objc_getAssociatedObject(self, &WebViewProgress.Key) as? WebViewProgress
        }
        set {
            if let newValue = newValue  {
                objc_setAssociatedObject(self, &WebViewProgress.Key, newValue as WebViewProgress?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    private func getWebProgress() -> WebViewProgress {
        if self.wProgress == nil {
            self.wProgress = WebViewProgress();
        }
        return self.wProgress!;
    }
    
    func wkWebAddObserverProgress(_ offsetY: CGFloat, _ block: WebViewProgress.ProgressBlock? ) {
        getWebProgress().addProgressObserver(self,offsetY, block)
    }
    
    func wkWebAddObserverTitleChange(_ block: WebViewProgress.ProgressBlock?) {
        getWebProgress().addTitleObserver(self, block)
    }
    
    
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
    
    func wkWebAddJsMethod(_ uController: WKUserContentController,_ name: String, _ block: JsMethodModel.JSBlock? ) {
        jsControl(uController).addJs(name, handler: block)
    }
    
    func wkWebRemoveAllJsHandle(_ uController: WKUserContentController) {
        jsControl(uController).removeAllMethods()
    }
    
}


public class JsMethodControl : NSObject, WKScriptMessageHandler {
    
    public static var Key = "JsMethodControlKey";
    
    private var uController: WKUserContentController?
    var sd: JsMethodModel?
    
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

//处理WKWebView的加载进度和监听title变化的类
public class WebViewProgress: NSObject {
    
    public static var Key = "WebViewProgressKey";
    public static var ProgressKey = "estimatedProgress";
    public static var TitleKey = "title";
    public typealias ProgressBlock = ( (_ KeyPath: String?, _ newVal: Any?)->Void )
    
    var pBlock: ProgressBlock?
    var tBlock: ProgressBlock?
    
    private lazy var progressColorLayer: CAGradientLayer = {
        let layer: CAGradientLayer = CAGradientLayer()
        layer.frame = makeRect(0, 80, phoneWidth*0.05, 4)
        layer.startPoint = makePoint(0, 1)
        layer.endPoint = makePoint(1, 1)
        let c: UIColor = color("10E010")
        layer.colors = [c.cgColor, c.colorAlpha(0.1).cgColor]
        return layer
    }()
    
    func addProgressObserver(_ web: WKWebView, _ offsetY: CGFloat, _ block: ProgressBlock?) {
        self.pBlock = block
        web.addObserver(self, forKeyPath: WebViewProgress.ProgressKey, options: NSKeyValueObservingOptions.new, context: nil)
        web.layer.addSublayer(self.progressColorLayer)
        var f = self.progressColorLayer.frame
        f.origin.y = offsetY
        self.progressColorLayer.frame = f;
    }
    
    func addTitleObserver(_ web: WKWebView, _ block: ProgressBlock?) {
        self.tBlock = block
        web.addObserver(self, forKeyPath: WebViewProgress.TitleKey, options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        Dlog("keypath: \(String(describing: keyPath))")
        let any: Any = change![NSKeyValueChangeKey.newKey]!
        
        if keyPath == WebViewProgress.ProgressKey {
            if self.pBlock != nil {
                self.pBlock!(keyPath,any)
            }
            var progress: CGFloat = any as! CGFloat
            if (progress >= 1.0) {
                self.progressColorLayer.isHidden = true
                return
            }
            
            if progress <= 0.05 {
                progress = 0.05
            }
            self.progressColorLayer.isHidden = false
            var f: CGRect = self.progressColorLayer.frame
            f.size.width = phoneWidth * progress
            self.progressColorLayer.frame = f
        }
        else if keyPath == WebViewProgress.TitleKey {
            if self.tBlock != nil {
                self.tBlock!(keyPath,any)
            }
        }
    }
}

