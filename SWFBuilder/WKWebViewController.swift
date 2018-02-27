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

public typealias DWKBlock = ((_ webView: WKWebView)->Void)?
public typealias DWKJSBlock = ((_ userContentController: WKUserContentController)->Void)?

public class WKWebViewController: UIViewController, WKNavigationDelegate,WKUIDelegate {
    
    var webView: WKWebView?
    var urlString: String?
    
    var webStartBlock: DWKBlock?
    var webEndBlock: DWKBlock?
    var webErrorBlock: DErrorBlock?
    var webJsBlock: DWKJSBlock?
    
    private lazy var userController: WKUserContentController = {
        let u: WKUserContentController = WKUserContentController()
        return u
    }()
    
    convenience init(url: String) {
        self.init(nibName: nil, bundle: nil)
        self.urlString = url
    }
    
    convenience init(url: String, startBlock: DWKBlock, endBlock: DWKBlock, errorBlock: DErrorBlock) {
        self.init(nibName: nil, bundle: nil)
        self.urlString = url
        self.webStartBlock = startBlock
        self.webEndBlock = endBlock
        self.webErrorBlock = errorBlock
    }
    
    convenience init(url: String, startBlock: DWKBlock, endBlock: DWKBlock, errorBlock: DErrorBlock, jsRegisterBlock: DWKJSBlock) {
        self.init(nibName: nil, bundle: nil)
        self.urlString = url
        self.webStartBlock = startBlock
        self.webEndBlock = endBlock
        self.webErrorBlock = errorBlock
        self.webJsBlock = jsRegisterBlock
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addLeft(anyObject: nil, block: nil)
        
        if (self.webJsBlock != nil){
            self.webJsBlock!!(self.userController)
        }
        let config: WKWebViewConfiguration = WKWebViewConfiguration()
        config.preferences.javaScriptEnabled = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        config.userContentController = self.userController
        
        self.webView = WKWeb(self.view.bounds, config)
            .wkWebDelegate(self)
            .wkWebNaviDelegate(self)
            .wkWebLoadUrlStr(self.urlString!)
            .viewIntoView(self.view) as? WKWebView
        
        self.webView?.wkWebAddObserverProgress(64, nil)
        
        self.webView?.wkWebAddObserverTitleChange({ [weak self] (keyPath: String?, newVal: Any?) in
            self?.addTitle(title: newVal as! String)
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
        Alert().setMsg(message).addAction(name: "OK", style: UIAlertActionStyle.default) { (alert: UIAlertAction) in
            completionHandler()
        }.show(self)
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        Alert().setMsg(message).addAction(name: "OK", style: UIAlertActionStyle.default) { (alert: UIAlertAction) in
            completionHandler(true)
            }.addAction(name: "Cancel", style: UIAlertActionStyle.cancel) { (alert: UIAlertAction) in
                completionHandler(false)
            }.show(self)
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        
        let alert: UIAlertController = UIAlertController.init(title: prompt, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField { (textFiled: UITextField) in
            textFiled.text = defaultText
        }
        alert.addAction(UIAlertAction.init(title: "Finish", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction) in
            completionHandler(alert.textFields![0].text)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        if (self.webStartBlock != nil){
            self.webStartBlock!!(webView)
        }
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if (self.webEndBlock != nil){
            self.webEndBlock!!(webView)
        }
    }
    
    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        //当第一次启动App时会询问是否允许，这里是同意后刷新，防止出现空白界面
        if (self.webErrorBlock != nil){
            self.webErrorBlock!!(error)
        }
        let err: NSError? = error as NSError
        if err?.code == -1009 {
            DoInMainAfter(2, { [weak self] in
                self?.webView?.load((self?.urlString?.strToRequest())!)
            })
        }
    }
    
    deinit {
        Dlog("deinit> \(self)")
    }
    
}
