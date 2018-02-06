//
//  URL+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func urlRequest(_ url: String) -> URLRequest {
    return URLRequest(url: URL(string: url)!)
}

func urlRequest(_ url: String, _ policy: URLRequest.CachePolicy) -> URLRequest {
    return URLRequest.init(url: URL(string: url)!, cachePolicy: policy, timeoutInterval: 30)
}

func urlRequest(_ url: String, _ policy: URLRequest.CachePolicy, _ timeOut: TimeInterval) -> URLRequest {
    return URLRequest.init(url: URL(string: url)!, cachePolicy: policy, timeoutInterval: timeOut)
}

extension URLRequest
{
    
}

