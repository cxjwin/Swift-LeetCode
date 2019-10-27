//
//  LintCode440Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/27.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class LintCode440Tests: XCTestCase {

    let p = LintCode440()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBackPackIII() {
        // Input: A = [2, 3, 5, 7], V = [1, 5, 2, 4], m = 10
        // Output: 15
        let res = p.backPackIII(10, [2, 3, 5, 7], [1, 5, 2, 4])
        XCTAssert(res == 15, "1 -> Output: 15")
        
        // Input: A = [1, 2, 3], V = [1, 2, 3], m = 5
        // Output: 5
        let res2 = p.backPackIII(5, [1, 2, 3], [1, 2, 3])
        XCTAssert(res2 == 5, "2 -> Output: 5")
    }

}
