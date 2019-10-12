//
//  Problem221Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/12.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem221Tests: XCTestCase {
    let p = Problem221()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMaximalSquare() {
        /*
        Input:

        1 0 1 0 0
        1 0 1 1 1
        1 1 1 1 1
        1 0 0 1 0

        Output: 4
         */
        let res = p.maximalSquare([
            ["1", "0", "1", "0", "0"],
            ["1", "0", "1", "1", "1"],
            ["1", "1", "1", "1", "1"],
            ["1", "0", "0", "1", "0"]
        ])
        XCTAssert(res == 4, "1 -> Output: 4")
        
        let res2 = p.maximalSquare([
            ["1"]
        ])
        XCTAssert(res2 == 1, "2 -> Output: 1")
    }

}
