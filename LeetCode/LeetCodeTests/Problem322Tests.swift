//
//  Problem322Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/1.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem322Tests: XCTestCase {

    let p = Problem322()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoinChange() {
        // Input: coins = [1, 2, 5], amount = 11
        // Output: 3
        let res = p.coinChange([1, 2, 5], 11)
        XCTAssert(res == 3, "Explanation: 11 = 5 + 5 + 1")
        
        // Input: coins = [2], amount = 3
        // Output: -1
        let res2 = p.coinChange([2], 3)
        XCTAssert(res2 == -1, "No")
        
        // Input: coins = [1], amount = 0
        // Output: -1
        let res3 = p.coinChange([1], 0)
        XCTAssert(res3 == 0, "amount == 0, output 0")
    }

}
