//
//  Problem97Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/15.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem97Tests: XCTestCase {
    
    let p = Problem97()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsInterleave() {
        // Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
        // Output: true
        let res = p.isInterleave("aabcc", "dbbca", "aadbbcbcac")
        XCTAssert(res == true, "1 -> Output: true")

        // Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
        // Output: false
        let res2 = p.isInterleave("aabcc", "dbbca", "aadbbbaccc")
        XCTAssert(res2 == false, "2 -> Output: false")

        // Input: s1 = "a", s2 = "", s3 = "c"
        // Output: false
        let res3 = p.isInterleave("a", "", "c")
        XCTAssert(res3 == false, "3 -> Output: false")
        
        // Input: s1 = "db", s2 = "b", s3 = "cbb"
        // Output: false
        let res4 = p.isInterleave("db", "b", "cbb")
        XCTAssert(res4 == false, "4 -> Output: false")
    }

}
