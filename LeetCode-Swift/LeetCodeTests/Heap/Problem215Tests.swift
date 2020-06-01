//
//  Problem215Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/11/9.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem215Tests: XCTestCase {

    let p = Problem215()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFindKthLargest() {
        /*
        Input: [3,2,1,5,6,4] and k = 2
        Output: 5
         */
        let res = p.findKthLargest([3,2,1,5,6,4], 2)
        XCTAssert(res == 5)
    
        /*
         Input: [11, 3, 2, 1, 15, 5, 4, 45, 88, 96, 50, 45] and k = 3
         Output: 4
         */
        let res2 = p.findKthLargest([11, 3, 2, 1, 15, 5, 4, 45, 88, 96, 50, 45], 3)
        XCTAssert(res2 == 50)
        
        /*
         Input: [3,2,3,1,2,4,5,5,6] and k = 4
         Output: 4
         */
        let res3 = p.findKthLargest([3,2,3,1,2,4,5,5,6], 4)
        XCTAssert(res3 == 4)
    }

}
