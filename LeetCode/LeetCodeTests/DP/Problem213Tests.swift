//
//  Problem213Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/14.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem213Tests: XCTestCase {
    let p = Problem213()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRob() {
        // Input: [2,3,2]
        // Output: 3
        let res = p.rob([2,3,2])
        XCTAssert(res == 3, "1 -> Output: 3")
        
        // Input: [1,2,3,1]
        // Output: 4
        let res2 = p.rob([1,2,3,1])
        XCTAssert(res2 == 4, "2 -> Output: 4")
        
        // Input: [1]
        // Output: 1
        let res3 = p.rob([1])
        XCTAssert(res3 == 1, "3 -> Output: 1")
        
        // Input: [1, 5]
        // Output: 5
        let res4 = p.rob([1, 5])
        XCTAssert(res4 == 5, "4 -> Output: 5")
    }

}
