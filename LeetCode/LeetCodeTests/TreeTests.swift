//
//  TreeTests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/8/3.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class TreeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBuildTree() {
        let arr = [3, 2, 3, nil, 3, nil, 1]
        if let root = TreeNode.buildTree(arr) {
            var res = true
            if root.val == 3 {
                if let left = root.left {
                    if left.val == 2 {
                        if let right = left.right {
                            if right.val != 3 {
                                res = false
                            }
                        }
                    } else {
                        res = false
                    }
                } else {
                    res = false
                }
                
                if let right = root.right {
                    if right.val == 3 {
                        if let right = right.right {
                            if right.val != 1 {
                                res = false
                            }
                        }
                    } else {
                        res = false
                    }
                }
            } else {
                res = false
            }
            XCTAssert(res, "leaf is error")
        } else {
            XCTAssert(false, "fail to create tree")
        }
    }

}
