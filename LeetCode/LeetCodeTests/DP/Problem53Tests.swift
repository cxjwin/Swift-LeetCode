//
//  Problem53Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/15.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem53Tests: XCTestCase {

    let p = Problem53()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Input: [-2,1,-3,4,-1,2,1,-5,4],
        // Output: 6
        let res = p.maxSubArray1([-2,1,-3,4,-1,2,1,-5,4])
        XCTAssert(res == 6, "1 -> Output: 6")
        
        let res2 = p.maxSubArray2([-2,1,-3,4,-1,2,1,-5,4])
        XCTAssert(res2 == 6, "2 -> Output: 6")
        
        let res3 = p.maxSubArray3([-2,1,-3,4,-1,2,1,-5,4])
        XCTAssert(res3 == 6, "3 -> Output: 6")
        
        let res4 = p.maxSubArray4([-2,1,-3,4,-1,2,1,-5,4])
        XCTAssert(res4 == 6, "3 -> Output: 6")
    }

}
