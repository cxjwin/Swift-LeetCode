//
//  Problem62Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/2.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem62Tests: XCTestCase {

    let p = Problem62()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUniquePaths() {
        // Input: m = 3, n = 2
        // Output: 3
        let res = p.uniquePaths(3, 2)
        XCTAssert(res == 3, "Output: 3")
        
        // Input: m = 7, n = 3
        // Output: 28
        let res2 = p.uniquePaths(7, 3)
        XCTAssert(res2 == 28, "Output: 28")
    }

}
