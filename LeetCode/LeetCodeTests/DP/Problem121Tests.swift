//
//  Problem121Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/16.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem121Tests: XCTestCase {
    
    let p = Problem121()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Input: [7,1,5,3,6,4]
        // Output: 5
        let res = p.maxProfit([7,1,5,3,6,4])
        XCTAssert(res == 5, "1 -> Output: 5")
        
        // Input: [7,6,4,3,1]
        // Output: 0
        let res2 = p.maxProfit([7,6,4,3,1])
        XCTAssert(res2 == 0, "2 -> Output: 0")
    }

}
