//
//  Problem198Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/14.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem198Tests: XCTestCase {
    let p = Problem198()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRob() {
        // Input: [1,2,3,1]
        // Output: 4
        let res = p.rob([1,2,3,1])
        XCTAssert(res == 4, "1 -> Output: 4")
        
        // Input: [2,7,9,3,1]
        // Output: 12
        let res2 = p.rob([2,7,9,3,1])
        XCTAssert(res2 == 12, "2 -> Output: 12")
    }

}
