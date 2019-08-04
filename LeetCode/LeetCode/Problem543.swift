//
//  Problem543.swift
//  LeetCode
//
//  Created by smart on 2019/8/3.
//  Copyright © 2019 smart. All rights reserved.
//

import Foundation

public class Problem543 {
    public init() {
        //
    }

    private func maxDepth(_ root: TreeNode?, _ d: UnsafeMutablePointer<Int>) -> Int {
        guard let root = root else { return 0 }
        
        let left = maxDepth(root.left, d)
        let right = maxDepth(root.right, d)
        d.initialize(to: max(d.pointee, left + right))
        return max(left, right) + 1
    }
    
    public func diameterOfBinaryTreeRecursive(_ root: TreeNode?) -> Int {
        var d = 0
        _ = maxDepth(root, &d)
        return d
    }
    
    public func diameterOfBinaryTreeIterative(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var diameter = 0
        var m: [ObjectIdentifier:Int] = [:]
        var st = [root]
        
        while st.count > 0 {
            let node = st.last!
            
            if let left = node.left {
                if m[ObjectIdentifier(left)] == nil {
                    st.append(left)
                    continue
                }
            }
            
            if let right = node.right {
                if m[ObjectIdentifier(right)] == nil {
                    st.append(right)
                    continue
                }
            }
            
            st.removeLast()
            
            var leftVal = 0
            if let left = node.left, let val = m[ObjectIdentifier(left)] {
                leftVal = val
            }
            var rightVal = 0
            if let right = node.right, let val = m[ObjectIdentifier(right)] {
                rightVal = val
            }
            diameter = max(diameter, leftVal + rightVal)
            m[ObjectIdentifier(node)] = max(leftVal, rightVal) + 1
        }
        
        return diameter
    }
}
