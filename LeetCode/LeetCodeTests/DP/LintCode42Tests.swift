//
//  LintCode42Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/18.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class LintCode42Tests: XCTestCase {
    
    let p = LintCode42()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMaxTwoSubArrays() {
        // Input: [1, 3, -1, 2, -1, 2]
        // Output: 7
        let res = p.maxTwoSubArrays([1, 3, -1, 2, -1, 2])
        XCTAssert(res == 7, "1 -> Output: 7")
        
        // Input: [5,4]
        // Output: 9
        let res2 = p.maxTwoSubArrays([5,4])
        XCTAssert(res2 == 9, "2 -> Output: 9")
    }
    
    func testMaxTwoSubArrays2() {
        // Input: [1, 3, -1, 2, -1, 2]
        // Output: 7
        let res = p.maxTwoSubArrays2([1, 3, -1, 2, -1, 2])
        XCTAssert(res == 7, "1 -> Output: 7")
        
        // Input: [5,4]
        // Output: 9
        let res2 = p.maxTwoSubArrays2([5,4])
        XCTAssert(res2 == 9, "2 -> Output: 9")
    }

}
