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
        getWebProgress().addProgressObserver(self,offsetY,nil, block)
    }
    
    func wkWebAddObserverProgress(_ offsetY: CGFloat, _ progressBgColor: UIColor, _ block: WebViewProgress.ProgressBlock? ) {
        getWebProgress().addProgressObserver(self,offsetY,progressBgColor, block)
    }
    
    func wkWebFinishProgress() {
        getWebProgress().finishProgress()
    }
    
    func wkWebAddObserverTitleChange(_ block: WebViewProgress.ProgressBlock?) {
        getWebProgress().addTitleObserver(self, block)
    }
    
    func wkWebRemoveObserver() {
        if self.wProgress != nil {
            if(getWebProgress().pEnable) {
                self.removeObserver(getWebProgress(), forKeyPath: WebViewProgress.ProgressKey)
            }
            if(getWebProgress().tEnable) {
                self.removeObserver(getWebProgress(), forKeyPath: WebViewProgress.TitleKey)
            }
        }
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
    var pEnable: Bool = false
    var tEnable: Bool = false
    
    
    private lazy var progressColorLayer: CAGradientLayer = {
        let layer: CAGradientLayer = CAGradientLayer()
        layer.frame = makeRect(0, 0, phoneWidth*0.05, 3)
        layer.startPoint = makePoint(0, 1)
        layer.endPoint = makePoint(1, 1)
        let c: UIColor = DF_WebViewLoadProgressColor
        layer.colors = [c.cgColor, c.colorAlpha(0.2).cgColor]
        return layer
    }()
    
    func addProgressObserver(_ web: WKWebView, _ offsetY: CGFloat, _ bgColor: UIColor?, _ block: ProgressBlock?) {
        self.pBlock = block
        self.pEnable = true
        web.addObserver(self, forKeyPath: WebViewProgress.ProgressKey, options: NSKeyValueObservingOptions.new, context: nil)
        web.layer.addSublayer(self.progressColorLayer)
        if bgColor != nil {
            self.progressColorLayer.colors = [bgColor!.cgColor, bgColor!.colorAlpha(0.2).cgColor]
        }
        self.progressColorLayer.frame = self.progressColorLayer.frame.rectSetY(offsetY);
    }
    
    func finishProgress() {
        _ = self.progressColorLayer.frame.rectSetW(0)
        self.progressColorLayer.isHidden = true
    }
    
    func addTitleObserver(_ web: WKWebView, _ block: ProgressBlock?) {
        self.tBlock = block
        self.tEnable = true
        web.addObserver(self, forKeyPath: WebViewProgress.TitleKey, options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
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
            self.progressColorLayer.frame = self.progressColorLayer.frame.rectSetW(phoneWidth * progress)
        }
        else if keyPath == WebViewProgress.TitleKey {
            if self.tBlock != nil {
                self.tBlock!(keyPath,any)
            }
        }
        
    }
    
}

