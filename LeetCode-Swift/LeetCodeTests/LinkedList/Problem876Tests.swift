//
//  Problem876Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/11/30.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem876Tests: XCTestCase {

    let p = Problem876()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMiddleNode() {
        let head: ListNode? = ListNode(1)
        head?.next = ListNode(2)
        head?.next?.next = ListNode(3)
        head?.next?.next?.next = ListNode(4)
        head?.next?.next?.next?.next = ListNode(5)
        
        let node = p.middleNode(head)
        
        XCTAssert(node?.val == 3)
    }

}
