//
//  LintCode43Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/18.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class LintCode43Tests: XCTestCase {

    let p = LintCode43()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        /*
         Input:
         List = [1,2,3]
         k = 1
         Output: 6
         Explanation: 1 + 2 + 3 = 6
         */
        let res = p.maxTwoSubArrays([1,2,3], 1)
        XCTAssert(res == 6, "1 -> Output: 6")
        
        /*
         Input:
         List = [-1,4,-2,3,-2,3]
         k = 2
         Output: 8
         Explanation: 4 + (3 + -2 + 3) = 8
         */
        let res2 = p.maxTwoSubArrays([-1,4,-2,3,-2,3], 2)
        XCTAssert(res2 == 8, "2 -> Output: 8")
    }

}
