//
//  Problem155Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/12/1.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem155Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMinStack() {
        let s = MinStack()
        s.push(-2)
        s.push(0)
        s.push(-3)
        XCTAssert(s.getMin() == -3)
        s.pop()
        XCTAssert(s.top() == 0)
        XCTAssert(s.getMin() == -2)
    }
    
    func testMinStack2() {
        let s = MinStack()
        s.push(0)
        s.push(1)
        s.push(0)
        XCTAssert(s.getMin() == 0)
        s.pop()
        XCTAssert(s.getMin() == 0)
    }

}
