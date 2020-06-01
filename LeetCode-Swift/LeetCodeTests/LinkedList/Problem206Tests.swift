//
//  Problem206Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/11/28.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem206Tests: XCTestCase {

    let p = Problem206()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEeverseList2() {
//        Input: 1->2->3->4->5->NULL
//        Output: 5->4->3->2->1->NULL
        let head = ListNode(1)
        head.next = ListNode(2)
        head.next?.next = ListNode(3)
        head.next?.next?.next = ListNode(4)
        head.next?.next?.next?.next = ListNode(5)
        
        let node = p.reverseList2(head)
        
        print(node)
    }

}
