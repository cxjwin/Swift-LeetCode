//
//  HeapTests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/11/8.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class HeapTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testShiftDown() {
        // [1, 3, 6, 5, 9, 8]
        let arr = [7, 6, 5, 4, 3, 2, 1]
        let h = Heap<Int>(array: arr, sort: <)
        XCTAssert(h.allNodes == [])
    }

}
