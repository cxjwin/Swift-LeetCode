//
//  Problem122Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/17.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem122Tests: XCTestCase {
    
    let p = Problem122()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Input: [7,1,5,3,6,4]
        // Output: 7
        let res = p.maxProfit([7,1,5,3,6,4])
        XCTAssert(res == 7, "1 -> Output: 7")
        
        // Input: [1,2,3,4,5]
        // Output: 4
        let res2 = p.maxProfit([1,2,3,4,5])
        XCTAssert(res2 == 4, "2 -> Output: 4")
    }

}
