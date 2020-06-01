//
//  Problem19Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/11/30.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem19Tests: XCTestCase {

    let p = Problem19()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRemoveNthFromEnd() {
        let head: ListNode? = ListNode(1)
        head?.next = ListNode(2)
        head?.next?.next = ListNode(3)
        head?.next?.next?.next = ListNode(4)
        head?.next?.next?.next?.next = ListNode(5)
        
        let node = p.removeNthFromEnd(head, 2)
        
        XCTAssert(node?.next?.next?.next?.val == 5)
    }

}
