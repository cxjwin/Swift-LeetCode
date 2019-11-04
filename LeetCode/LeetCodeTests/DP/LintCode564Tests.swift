//
//  LintCode564Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/11/1.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class LintCode564Tests: XCTestCase {

    let p = LintCode564()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBackPackVI() {
        /*
         Input: nums = [1, 2, 4], and target = 4
         Output: 6
         Explanation:
         The possible combination ways are:
         [1, 1, 1, 1]
         [1, 1, 2]
         [1, 2, 1]
         [2, 1, 1]
         [2, 2]
         [4]
         */
        let res = p.backPackVI([1, 2, 4], 4)
        XCTAssert(res == 6, "1 -> Output: 6")
        
        /*
         Input: nums = [1, 2], and target = 4
         Output: 5
         Explanation:
         The possible combination ways are:
         [1, 1, 1, 1]
         [1, 1, 2]
         [1, 2, 1]
         [2, 1, 1]
         [2, 2]
         */
        let res2 = p.backPackVI([1, 2], 4)
        XCTAssert(res2 == 5, "2 -> Output: 5")
    }

}
