//
//  Problem55Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/2.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem55Tests: XCTestCase {

    let p = Problem55()
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCanJump() {
        // Input: [2,3,1,1,4]
        // Output: true
        let res = p.canJump([2,3,1,1,4])
        XCTAssert(res == true, "Output: true")
        
        // Input: [3,2,1,0,4]
        // Output: false
        let res2 = p.canJump([3,2,1,0,4])
        XCTAssert(res2 == false, "Output: false")
    }

}
