//
//  Problem139Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/12.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem139Tests: XCTestCase {
    let p = Problem139()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWordBreak() {
        // Input: s = "leetcode", wordDict = ["leet", "code"]
        // Output: true
        let res = p.wordBreak("leetcode", ["leet", "code"])
        XCTAssert(res == true, "1 -> Output: true")
        
        // Input: s = "applepenapple", wordDict = ["apple", "pen"]
        // Output: true
        let res2 = p.wordBreak("applepenapple", ["apple", "pen"])
        XCTAssert(res2 == true, "2 -> Output: true")
        
        // Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
        // Output: false
        let res3 = p.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])
        XCTAssert(res3 == false, "3 -> Output: false")
    }
    
}
