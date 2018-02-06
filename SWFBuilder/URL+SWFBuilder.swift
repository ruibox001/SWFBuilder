//
//  URL+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

extension URL
{
    
    func urlToNSRequest() -> NSURLRequest? {
        return NSURLRequest(url: self)
    }
    
    func urlToNSRequest(_ cachePolicy: NSURLRequest.CachePolicy) -> NSURLRequest? {
        return NSURLRequest(url: self, cachePolicy: cachePolicy, timeoutInterval: 30)
    }
    
    func urlToNSRequest(_ cachePolicy: NSURLRequest.CachePolicy, _ timeOut: TimeInterval) -> NSURLRequest? {
        return NSURLRequest(url: self, cachePolicy: cachePolicy, timeoutInterval: timeOut)
    }
    
    
    func urlToRequest() -> URLRequest? {
        return URLRequest(url: self)
    }
    
    func urlToRequest(_ cachePolicy: NSURLRequest.CachePolicy) -> URLRequest? {
        return URLRequest(url: self, cachePolicy: cachePolicy, timeoutInterval: 30)
    }
    
    func urlToRequest(_ cachePolicy: NSURLRequest.CachePolicy, _ timeOut: TimeInterval) -> URLRequest? {
        return URLRequest(url: self, cachePolicy: cachePolicy, timeoutInterval: timeOut)
    }
    
}

