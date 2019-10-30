//
//  LintCode513Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/29.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class LintCode513Tests: XCTestCase {
    
    let p = LintCode513()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumSquares() {
        /*
        Input: 12
        Output: 3
        Explanation: 4 + 4 + 4
         */
        let res = p.numSquares(12)
        XCTAssert(res == 3, "1 -> Output: 3")
        
        /*
         Input: 13
         Output: 2
         Explanation: 4 + 9
         */
        let res2 = p.numSquares(13)
        XCTAssert(res2 == 2, "2 -> Output: 2")
    }

}
