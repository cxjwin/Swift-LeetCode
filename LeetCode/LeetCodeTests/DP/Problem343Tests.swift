//
//  Problem343Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/15.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem343Tests: XCTestCase {

    let p = Problem343()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIntegerBreak() {
        // Input: 2
        // Output: 1
        let res = p.integerBreak(2)
        XCTAssert(res == 1, "1 -> Output: 1")
        
        let res2 = p.integerBreak(3)
        XCTAssert(res2 == 2, "2 -> Output: 2")
        
        let res3 = p.integerBreak(5)
        XCTAssert(res3 == 6, "3 -> Output: 6")
        
        // Input: 10
        // Output: 36
        let res4 = p.integerBreak(10)
        XCTAssert(res4 == 36, "4 -> Output: 36")
        
        let res5 = p.integerBreak(6)
        XCTAssert(res5 == 9, "5 -> Output: 9")
    }

}
