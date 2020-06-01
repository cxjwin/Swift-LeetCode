//
//  Problem12Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/12/3.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem12Tests: XCTestCase {

    let p = Problem12()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
//        Input: 1994
//        Output: "MCMXCIV"
//        Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
        XCTAssert(p.intToRoman(1994) == "MCMXCIV")
        
//        Input: 58
//        Output: "LVIII"
//        Explanation: L = 50, V = 5, III = 3.
        XCTAssert(p.intToRoman(58) == "LVIII")
        
//        Input: 9
//        Output: "IX"
        XCTAssert(p.intToRoman(9) == "IX")
        
//        Input: 4
//        Output: "IV"
        XCTAssert(p.intToRoman(4) == "IV")
        
//        Input: 3
//        Output: "III"
        XCTAssert(p.intToRoman(3) == "III")
        
    }
    
}
