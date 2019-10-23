//
//  LintCode92Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/23.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class LintCode92Tests: XCTestCase {

    let p = LintCode92()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBackPack() {
        // Input:  [3,4,8,5], backpack size=10
        // Output:  9
        let res = p.backPack(10, [3,4,8,5])
        XCTAssert(res == 9, "1 -> Output:  9")
        
        // Input:  [2,3,5,7], backpack size=12
        // Output:  12
        let res2 = p.backPack(12, [2,3,5,7])
        XCTAssert(res2 == 12, "2 -> Output:  12")
    }
    
    func testBackPack2() {
        // Input:  [3,4,8,5], backpack size=10
        // Output:  9
        let res = p.backPack2(10, [3,4,8,5])
        XCTAssert(res == 9, "1 -> Output:  9")
        
        // Input:  [2,3,5,7], backpack size=12
        // Output:  12
        let res2 = p.backPack2(12, [2,3,5,7])
        XCTAssert(res2 == 12, "2 -> Output:  12")
    }

}
