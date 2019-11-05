//
//  Problem821Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/11/5.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem821Tests: XCTestCase {

    let p = Problem821()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShortestToChar() {
        /*
         Input: S = "loveleetcode", C = 'e'
         Output: [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0]
         */
        let res = p.shortestToChar("loveleetcode", "e")
        XCTAssert(res == [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0], "1 -> Output: [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0]")
        
        
    }

}
