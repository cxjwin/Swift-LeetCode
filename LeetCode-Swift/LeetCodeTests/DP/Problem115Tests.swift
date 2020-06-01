//
//  Problem115Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/15.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem115Tests: XCTestCase {

    let p = Problem115()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Input: S = "rabbbit", T = "rabbit"
        // Output: 3
        let res = p.numDistinct("rabbbit", "rabbit")
        XCTAssert(res == 3, "1 -> Output: 3")
        
        // Input: S = "babgbag", T = "bag"
        // Output: 5
        let res2 = p.numDistinct("babgbag", "bag")
        XCTAssert(res2 == 5, "2 -> Output: 5")
    }

}
