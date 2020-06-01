//
//  Problem844Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/12/1.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem844Tests: XCTestCase {

    let p = Problem844()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBackspaceCompare() {
//        Input: S = "ab#c", T = "ad#c"
//        Output: true
//        Explanation: Both S and T become "ac".
        XCTAssert(p.backspaceCompare("ab#c", "ad#c") == true)
        
//        Input: S = "ab##", T = "c#d#"
//        Output: true
//        Explanation: Both S and T become "".
        XCTAssert(p.backspaceCompare("ab##", "c#d#") == true)
        
//        Input: S = "a##c", T = "#a#c"
//        Output: true
//        Explanation: Both S and T become "c".
        XCTAssert(p.backspaceCompare("a##c", "#a#c") == true)
        
//        Input: S = "a#c", T = "b"
//        Output: false
//        Explanation: S becomes "c" while T becomes "b".
        XCTAssert(p.backspaceCompare("a#c", "b") == false)
    }

}
