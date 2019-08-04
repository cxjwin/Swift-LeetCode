//
//  Problem543Tests.swift
//  LeetCodeTests
//
//  Created by smart on 2019/8/4.
//  Copyright © 2019 smart. All rights reserved.
//

import XCTest
import LeetCode

class Problem543Tests: XCTestCase {
    
    let p = Problem543()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDiameterOfBinaryTreeRecursive() {
        let nums = [1, 2, 3, 4, 5]
        let root = TreeNode.buildTree(nums)
        let res = p.diameterOfBinaryTreeRecursive(root)
        XCTAssert(res == 3, "Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].")
    }

    func testDiameterOfBinaryTreeIterative() {
        let nums = [1, 2, 3, 4, 5]
        let root = TreeNode.buildTree(nums)
        let res = p.diameterOfBinaryTreeIterative(root)
        XCTAssert(res == 3, "Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].")
    }
}
