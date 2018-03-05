//
//  SWFBuilderDemoTests.swift
//  SWFBuilderDemoTests
//
//  Created by wsy on 2018/1/31.
//  Copyright © 2018年 liangweifeng. All rights reserved.
//

import XCTest
@testable import SWFBuilderDemo

class SWFBuilderDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Dlog("setUp")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        Dlog("tearDown")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        Dlog("testExample")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        Dlog("testPerformanceExample")
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
