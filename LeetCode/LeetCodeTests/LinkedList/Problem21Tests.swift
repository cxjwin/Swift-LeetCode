//
//  Problem21Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/11/30.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem21Tests: XCTestCase {

    let p = Problem21()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMergeTwoLists() {
        
        let l1: ListNode? = ListNode(1)
        l1?.next = ListNode(2)
        l1?.next?.next = ListNode(4)
        
        let l2: ListNode? = ListNode(1)
        l2?.next = ListNode(3)
        l2?.next?.next = ListNode(4)
        
        let node = p.mergeTwoLists(l1, l2)
        
        XCTAssert(node?.next?.next?.val == 2)
        XCTAssert(node?.next?.next?.next?.val == 3)
    }

}
