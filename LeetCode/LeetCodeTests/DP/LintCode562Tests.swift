//
//  LintCode562Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/27.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class LintCode562Tests: XCTestCase {

    let p = LintCode562()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBackPackIV() {
        // Input: nums = [2,3,6,7] and target = 7
        // Output: 2
        // [7], [2, 2, 3]
        let res = p.backPackIV([2,3,6,7], 7)
        XCTAssert(res == 2, "1 -> Output: 2")
        
        // Input: nums = [2,3,4,5] and target = 7
        // Output: 3
        // [2, 5], [3, 4], [2, 2, 3]
        let res2 = p.backPackIV([2,3,4,5], 7)
        XCTAssert(res2 == 3, "2 -> Output: 3")
    }

}
