//
//  Problem9Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/11/18.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem9Tests: XCTestCase {

    let p = Problem9()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsPalindrome() {
//        Input: 121
//        Output: true
        XCTAssert(p.isPalindrome(121) == true)
        
//        Input: -121
//        Output: false
//        Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
        XCTAssert(p.isPalindrome(-121) == false)
        
//        Input: 10
//        Output: false
//        Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
        XCTAssert(p.isPalindrome(10) == false)
        
        
        XCTAssert(p.isPalindrome(1221) == true)
    }

}
