//
//  LintCode437Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/31.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class LintCode437Tests: XCTestCase {

    let p = LintCode437()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCopyBooks() {
        /*
         Input: pages = [3, 2, 4], k = 2
         Output: 5
         Explanation:
             First person spends 5 minutes to copy book 1 and book 2.
             Second person spends 4 minutes to copy book 3.
         */
        let res = p.copyBooks([3, 2, 4], 2)
        XCTAssert(res == 5, "1 -> Output: 5")
        
        /*
         Input: pages = [3, 2, 4], k = 3
         Output: 4
         Explanation: Each person copies one of the books.
         */
        let res2 = p.copyBooks([3, 2, 4], 3)
        XCTAssert(res2 == 4, "2 -> Output: 4")
    }

}
