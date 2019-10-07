//
//  Problem64Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/6.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem64Tests: XCTestCase {

    let p = Problem64()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        /*
         Input:
         [
           [1,3,1],
           [1,5,1],
           [4,2,1]
         ]
         Output: 7
         */
        let res = p.minPathSum([
          [1,3,1],
          [1,5,1],
          [4,2,1]
        ])
        XCTAssert(res == 7, "1 -> Output: 7")
    }

}
