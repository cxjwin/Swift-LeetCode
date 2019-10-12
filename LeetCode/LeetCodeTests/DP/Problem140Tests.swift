//
//  Problem140Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/12.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem140Tests: XCTestCase {

    let p = Problem140()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWordBreak() {
        /*
         Input:
         s = "catsanddog"
         wordDict = ["cat", "cats", "and", "sand", "dog"]
         Output:
         [
           "cats and dog",
           "cat sand dog"
         ]
         */
        let res = p.wordBreak("catsanddog", ["cat", "cats", "and", "sand", "dog"])
        let output = [
          "cats and dog",
          "cat sand dog"
        ]
        for item in res {
            if !output.contains(item) {
                XCTAssert(false, item)
            }
        }
        
        /*
         Input:
         s = "pineapplepenapple"
         wordDict = ["apple", "pen", "applepen", "pine", "pineapple"]
         Output:
         [
           "pine apple pen apple",
           "pineapple pen apple",
           "pine applepen apple"
         ]
         */
        let res2 = p.wordBreak("pineapplepenapple", ["apple", "pen", "applepen", "pine", "pineapple"])
        let output2 = [
          "pine apple pen apple",
          "pineapple pen apple",
          "pine applepen apple"
        ]
        for item in res2 {
            if !output2.contains(item) {
                XCTAssert(false, item)
            }
        }
        
        /*
         Input:
         s = "catsandog"
         wordDict = ["cats", "dog", "sand", "and", "cat"]
         Output: []
         */
        let res3 = p.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])
        XCTAssert(res3.count == 0, "3 -> Output: []")
    }

}
