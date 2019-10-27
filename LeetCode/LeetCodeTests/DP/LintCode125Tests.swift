//
//  LintCode125Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/25.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class LintCode125Tests: XCTestCase {
    let p = LintCode125()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBackPackII() {
        // Input: m = 10, A = [2, 3, 5, 7], V = [1, 5, 2, 4]
        // Output: 9
        let res = p.backPackII(10, [2, 3, 5, 7], [1, 5, 2, 4])
        XCTAssert(res == 9, "1 -> Output: 9")
        
        // Input: m = 10, A = [2, 3, 8], V = [2, 5, 8]
        // Output: 10
        let res2 = p.backPackII(10, [2, 3, 8], [2, 5, 8])
        XCTAssert(res2 == 10, "2 -> Output: 10")
    }

}
