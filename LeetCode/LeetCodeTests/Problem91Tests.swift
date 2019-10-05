//
//  Problem91Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/5.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem91Tests: XCTestCase {

    let p = Problem91()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumDecodings() {
        // Input: "12"
        // Output: 2
        let res = p.numDecodings("12")
        XCTAssert(res == 2, "1 -> Output: 2")
        
        // Input: "226"
        // Output: 3
        let res2 = p.numDecodings("226")
        XCTAssert(res2 == 3, "2 -> Output: 3")
        
        // Input: "0"
        // Output: 0
        let res3 = p.numDecodings("0")
        XCTAssert(res3 == 0, "3 -> Output: 0")
        
        // Input: "01"
        // Output: 0
        let res4 = p.numDecodings("01")
        XCTAssert(res4 == 0, "4 -> Output: 0")
    }

}
