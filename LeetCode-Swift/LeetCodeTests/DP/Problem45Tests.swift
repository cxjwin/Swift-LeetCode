//
//  Problem45Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/11.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem45Tests: XCTestCase {
    let p = Problem45()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJump() {
        // Input: [2,3,1,1,4]
        // Output: 2
        let res = p.jump([2,3,1,1,4])
        XCTAssert(res == 2, "1 -> Output: 2")
    }
    
    func testJumpGreedy() {
        // Input: [2,3,1,1,4]
        // Output: 2
        let res = p.jumpGreedy([2,3,1,1,4])
        XCTAssert(res == 2, "1 -> Output: 2")
    }

}
