//
//  Problem152Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/16.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem152Tests: XCTestCase {
    
    let p = Problem152()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMaxProduct() {
        // Input: [2,3,-2,4]
        // Output: 6
        let res = p.maxProduct([2,3,-2,4])
        XCTAssert(res == 6, "1 -> Output: 6")
        
        // Input: [-2,0,-1]
        // Output: 0
        let res2 = p.maxProduct([-2,0,-1])
        XCTAssert(res2 == 0, "1 -> Output: 0")
    }

}
