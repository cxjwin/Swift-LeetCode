//
//  Problem63Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/4.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem63Tests: XCTestCase {

    let p = Problem63()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUniquePathsWithObstacles() {
        /*
        [
          [0,0,0],
          [0,1,0],
          [0,0,0]
        ]
        Output: 2
         */
        let res = p.uniquePathsWithObstacles([
            [0,0,0],
            [0,1,0],
            [0,0,0]
        ])
        XCTAssert(res == 2, "1 -> Output: 2")
        
        let res2 = p.uniquePathsWithObstacles([
            [1],
        ])
        XCTAssert(res2 == 0, "2 -> Output: 0")
    }

}
