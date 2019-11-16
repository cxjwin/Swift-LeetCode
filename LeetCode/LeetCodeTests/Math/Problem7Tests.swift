//
//  Problem7Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/11/12.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem7Tests: XCTestCase {

    let p = Problem7()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEeverse() {
        XCTAssert(p.reverse(123) == 321)
        
        XCTAssert(p.reverse(-123) == -321)
        
        XCTAssert(p.reverse(120) == 21)
        
        XCTAssert(p.reverse(1534236469) == 0)
    }

}
