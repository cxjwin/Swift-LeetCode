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
            if root.val != 3 ||
                root.left!.val != 2 ||
                root.right!.val != 3 ||
                root.left!.right!.val != 3 ||
                root.right!.right!.val != 1 {
                    XCTAssert(false, "leaf is error")
            }
        } else {
            XCTAssert(false, "fail to create tree")
        }
    }

}
