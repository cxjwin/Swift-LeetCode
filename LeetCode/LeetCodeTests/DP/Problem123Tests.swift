//
//  Problem123Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/17.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem123Tests: XCTestCase {
    
    let p = Problem123()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMaxProfit() {
        // Input: [3,3,5,0,0,3,1,4]
        // Output: 6
        let res = p.maxProfit([3,3,5,0,0,3,1,4])
        XCTAssert(res == 6, "1 -> Output: 6")
        
        // Input: [1,2,3,4,5]
        // Output: 4
        let res2 = p.maxProfit([1,2,3,4,5])
        XCTAssert(res2 == 4, "2 -> [1,2,3,4,5]")
    }

}
