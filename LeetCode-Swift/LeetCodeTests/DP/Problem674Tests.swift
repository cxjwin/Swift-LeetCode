//
//  Problem674Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/6.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem674Tests: XCTestCase {

    let p = Problem674()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFindLengthOfLCIS() {
        // Input: [1,3,5,4,7]
        // Output: 3
        let res = p.findLengthOfLCIS([1,3,5,4,7])
        XCTAssert(res == 3, "1 -> Output: 3")
        
        // Input: [2,2,2,2,2]
        // Output: 1
        let res2 = p.findLengthOfLCIS([2,2,2,2,2])
        XCTAssert(res2 == 1, "2 -> Output: 1")
    }

}
