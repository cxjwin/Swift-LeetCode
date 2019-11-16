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

    func testShiftDown() {
        let arr = [7, 6, 5, 4, 3, 2, 1]
        let h = Heap<Int>(array: arr, sort: <)
        print(h.allNodes)
    }
    
    func testInsert() {
        var h = Heap(array: [15, 13, 9, 5, 12, 8, 7, 4, 0, 6, 2, 1], sort: >)
        XCTAssertEqual(h.allNodes, [15, 13, 9, 5, 12, 8, 7, 4, 0, 6, 2, 1])
      
        h.insert(10)
        XCTAssertEqual(h.allNodes, [15, 13, 10, 5, 12, 9, 7, 4, 0, 6, 2, 1, 8])
    }
}
