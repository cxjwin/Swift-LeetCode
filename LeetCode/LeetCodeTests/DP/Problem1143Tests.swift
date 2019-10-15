//
//  Problem1143Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/15.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem1143Tests: XCTestCase {

    let p = Problem1143()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Input: text1 = "abcde", text2 = "ace"
        // Output: 3
        let res = p.longestCommonSubsequence("abcde", "ace")
        XCTAssert(res == 3, "1 -> Output: 3")
        
        // Input: text1 = "abc", text2 = "abc"
        // Output: 3
        let res2 = p.longestCommonSubsequence("abc", "abc")
        XCTAssert(res2 == 3, "2 -> Output: 3")
        
        // Input: text1 = "abc", text2 = "def"
        // Output: 0
        let res3 = p.longestCommonSubsequence("abc", "def")
        XCTAssert(res3 == 0, "3 -> Output: 0")
    }

}
