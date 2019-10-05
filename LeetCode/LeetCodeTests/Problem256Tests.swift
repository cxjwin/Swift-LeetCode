//
//  Problem256Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/5.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem256Tests: XCTestCase {

    let p = Problem256()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMinCost() {
        // Input: [[14,2,11],[11,14,5],[14,3,10]]
        // Output: 10
        let res = p.minCost([
            [14,2,11],
            [11,14,5],
            [14,3,10]
        ])
        XCTAssert(res == 10, "1 -> Output: 10")
        
        // Input: [[1,2,3],[1,4,6]]
        // Output: 3
        let res2 = p.minCost([
            [1,2,3],
            [1,4,6]
        ])
        XCTAssert(res2 == 3, "2 -> Output: 3")
    }

}
