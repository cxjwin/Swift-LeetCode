//
//  Problem611Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/18.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem611Tests: XCTestCase {

    let p = Problem611()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTriangleNumber() {
        // Input: [2,2,3,4]
        // Output: 3
        let res = p.triangleNumber([2,2,3,4])
        XCTAssert(res == 3, "1 -> Output: 3")
    }

    func testTriangleNumberSort() {
        // Input: [2,2,3,4]
        // Output: 3
        let res = p.triangleNumberSort([2,2,3,4])
        XCTAssert(res == 3, "1 -> Output: 3")
    }
    
}
