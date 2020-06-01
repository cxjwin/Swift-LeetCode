//
//  Problem6Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/11/7.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem6Tests: XCTestCase {

    let p = Problem6()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConvert() {
        /*
        Input: s = "PAYPALISHIRING", numRows = 3
        Output: "PAHNAPLSIIGYIR"
         */
        XCTAssert(p.convert("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
        
        /*
         Input: s = "PAYPALISHIRING", numRows = 4
         Output: "PINALSIGYAHRPI"
         */
        XCTAssert(p.convert("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
    }

}
