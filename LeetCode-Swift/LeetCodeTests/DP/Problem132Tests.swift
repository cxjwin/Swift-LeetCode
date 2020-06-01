//
//  Problem132Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/30.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem132Tests: XCTestCase {

    let p = Problem132()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMinCut() {
        // Input: "aab"
        // Output: 1
        let res = p.minCut("aab")
        XCTAssert(res == 1, "Output: 1")
    }

}
