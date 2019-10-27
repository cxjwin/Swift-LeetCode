//
//  LintCode563Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/27.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class LintCode563Tests: XCTestCase {

    let p = LintCode563()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        /*
         Given candidate items [1,2,3,3,7] and target 7,

         A solution set is:
         [7]
         [1, 3, 3]
         return 2
         */
        let res = p.backPackV([1,2,3,3,7], 7)
        XCTAssert(res == 2, "1 -> Output 2")
    }

}
