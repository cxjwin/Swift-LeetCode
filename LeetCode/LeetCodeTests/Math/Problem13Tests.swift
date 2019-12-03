//
//  Problem13Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/12/4.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem13Tests: XCTestCase {

    let p = Problem13()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
//        Input: "MCMXCIV"
//        Output: 1994
//        Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
        XCTAssert(p.romanToInt("MCMXCIV") == 1994)
        
//        Input: "LVIII"
//        Output: 58
//        Explanation: L = 50, V= 5, III = 3.
        XCTAssert(p.romanToInt("LVIII") == 58)

//        Input: "IX"
//        Output: 9
        XCTAssert(p.romanToInt("IX") == 9)
        
//        Input: "IV"
//        Output: 4
        XCTAssert(p.romanToInt("IV") == 4)
        
//        Input: "III"
//        Output: 3
        XCTAssert(p.romanToInt("III") == 3)
    }

}
