//
//  Problem20Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/12/1.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem20Tests: XCTestCase {

    let p = Problem20()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsValid() {
        XCTAssert(p.isValid("()") == true)
        
        XCTAssert(p.isValid("()[]{}") == true)
        
        XCTAssert(p.isValid("(]") == false)
        
        XCTAssert(p.isValid("([)]") == false)
        
        XCTAssert(p.isValid("{[]}") == true)
        
        XCTAssert(p.isValid("]") == false)
        
        XCTAssert(p.isValid("(])") == false)
    }

}
