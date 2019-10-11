//
//  Problem300Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/11.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem300Tests: XCTestCase {
    let p = Problem300()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLengthOfLIS() {
        // Input: [10,9,2,5,3,7,101,18]
        // Output: 4
        let res = p.lengthOfLIS([10,9,2,5,3,7,101,18])
        XCTAssert(res == 4, "Output: 4")
    }

}
