//
//  Problem72Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/15.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem72Tests: XCTestCase {
    
    let p = Problem72()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMinDistance() {
        // Input: word1 = "horse", word2 = "ros"
        // Output: 3
        let res = p.minDistance("horse", "ros")
        XCTAssert(res == 3, "1-> Output: 3")
        
        // Input: word1 = "intention", word2 = "execution"
        // Output: 5
        let res2 = p.minDistance("intention", "execution")
        XCTAssert(res2 == 5, "2-> Output: 5")
    }

}
