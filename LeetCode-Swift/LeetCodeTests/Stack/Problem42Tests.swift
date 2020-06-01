//
//  Problem42Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/12/3.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem42Tests: XCTestCase {

    let p = Problem42()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTrap() {
        let res4 = p.trap([4,2,3])
        XCTAssert(res4 == 1)
        
//        Input: [0,1,0,2,1,0,1,3,2,1,2,1]
//        Output: 6
        let res = p.trap([0,1,0,2,1,0,1,3,2,1,2,1])
        XCTAssert(res == 6)
        
//        Input: [0,1,0,2,1,0,1,3,2,1,2,1,8]
//        Output: 11
        let res2 = p.trap([0,1,0,2,1,0,1,3,2,1,2,1,8])
        XCTAssert(res2 == 11)
        
        let res3 = p.trap([2,0,2])
        XCTAssert(res3 == 2)
    }
    
     func testTrap2() {
            let res4 = p.trap2([4,2,3])
            XCTAssert(res4 == 1)
            
    //        Input: [0,1,0,2,1,0,1,3,2,1,2,1]
    //        Output: 6
            let res = p.trap2([0,1,0,2,1,0,1,3,2,1,2,1])
            XCTAssert(res == 6)
            
    //        Input: [0,1,0,2,1,0,1,3,2,1,2,1,8]
    //        Output: 11
            let res2 = p.trap2([0,1,0,2,1,0,1,3,2,1,2,1,8])
            XCTAssert(res2 == 11)
            
            let res3 = p.trap2([2,0,2])
            XCTAssert(res3 == 2)
        }

}
