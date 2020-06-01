//
//  Problem232Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/12/1.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem232Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMyQueue() {
        let queue = MyQueue()
        queue.push(1)
        queue.push(2)
        XCTAssert(queue.peek() == 1)
        XCTAssert(queue.pop() == 1)
        XCTAssert(queue.empty() == false)
    }

}
