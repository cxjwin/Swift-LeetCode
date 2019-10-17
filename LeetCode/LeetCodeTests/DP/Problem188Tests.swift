//
//  Problem188Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/17.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem188Tests: XCTestCase {

    let p = Problem188()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Input: [2,4,1], k = 2
        // Output: 2
        let res = p.maxProfit(2, [2,4,1])
        XCTAssert(res == 2, "1 -> Output: 2")
        
        // Input: [3,2,6,5,0,3], k = 2
        // Output: 7
        let res2 = p.maxProfit(2, [3,2,6,5,0,3])
        XCTAssert(res2 == 7, "2 -> Output: 7")
    }

}
