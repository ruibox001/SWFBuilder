//
//  ExampleViewController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/16.
//  Copyright © 2017年 Egg Swift. All rights reserved.
//

import Foundation
import UIKit
import WebKit

public class WKWebViewController: UIViewController, WKNavigationDelegate,WKUIDelegate {
    
    var webView: WKWebView?
    
    private lazy var userController: WKUserContentController = {
        let u: WKUserContentController = WKUserContentController()
        return u
    }()
    
    //Js调用原生注册手柄
    public lazy var jsController: JsMethodControl = {
        let jsController: JsMethodControl = JsMethodControl(self.userController)
        return jsController
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addLeft(anyObject: nil, block: nil)
        
        let config: WKWebViewConfiguration = WKWebViewConfiguration()
        config.preferences.javaScriptEnabled = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        config.userContentController = self.userController
        
        self.webView = WKWeb(self.view.bounds, config)
            .wkWebDelegate(self)
            .wkWebNaviDelegate(self)
            .wkWebLoadUrlStr("https://baidu.com")
            .viewIntoView(self.view) as? WKWebView
        
        self.webView?.wkWebAddObserverProgress(64, nil)
        
        self.webView?.wkWebAddObserverTitleChange({ (keyPath: String?, newVal: Any?) in
            Dlog("title > \(String(describing: keyPath)) >> \(String(describing: newVal))")
            self.addTitle(title: newVal as! String)
        })
    }
    
    //代理方法
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(WKNavigationActionPolicy.allow)
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(WKNavigationResponsePolicy.allow)
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
    }
    
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        Dlog("webView > start")
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Dlog("webView > finish")
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        Dlog("webView > error: \(error)")
    }
    
    deinit {
        Dlog("deinit> \(self)")
    }
    
}
