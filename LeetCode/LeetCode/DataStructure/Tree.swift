//
//  Tree.swift
//  LeetCode
//
//  Created by smart on 2019/8/3.
//  Copyright © 2019 smart. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

/*
* 根据树的层序遍历数组，构建一棵二叉树。例如：
* 输入：[3,2,3,nil,3,nil,1]
*
* 构建的二叉树是：
*     3
*    / \
*   2   3
*    \   \
*     3   1
*
* 注意：如果某个位置上的节点为 nil，那么它左右子树的 nil 不需要写出来。
* 比如对于下面这棵树：
*     1
*      \
*       2
*        \
*         4
* 应该表示为：[1,nil,2,nil,4]
* 而不是：[1,nil,2,nil,nil,nil,4]
*
*/
extension TreeNode {
    // BuildItem for create Tree
    struct BuildItem {
        var parent: TreeNode
        var childVal: Int?
        var isLeft: Bool
    }
    
    public class func buildTree(_ nums: [Int?]) -> TreeNode? {
        let dummy = TreeNode(0)
        let item = BuildItem(parent: dummy, childVal: nums[0], isLeft: true)
        var q: [BuildItem] = []
        q.append(item)
        var p = 1
        
        while q.count > 0 {
            let it = q[0]
            q.remove(at: 0)
            
            var child: TreeNode? = nil
            if let childVal = it.childVal {
                child = TreeNode(childVal)
            }
            
            if it.isLeft {
                it.parent.left = child
            } else {
                it.parent.right = child
            }
            
            if child != nil {
                if p < nums.count {
                    q.append(BuildItem(parent: child!, childVal: nums[p], isLeft: true))
                    p += 1
                }
                if p < nums.count {
                    q.append(BuildItem(parent: child!, childVal: nums[p], isLeft: false))
                    p += 1
                }
            }
        }
        
        return dummy.left
    }
}
