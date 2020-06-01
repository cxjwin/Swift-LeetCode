//
//  Problem1Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/12/18.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem1Tests: XCTestCase {

    let p = Problem1()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTwoSum() {
        /*
         Given nums = [2, 7, 11, 15], target = 9,
         Because nums[0] + nums[1] = 2 + 7 = 9,
         return [0, 1].
         */
        let res = p.twoSum([2, 7, 11, 15], 9)
        XCTAssert(res == [0, 1])
    }

}
