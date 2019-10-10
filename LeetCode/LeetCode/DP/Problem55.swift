//
//  Problem55.swift
//  LeetCode
//
//  Created by smart on 2019/10/2.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem55: Problem {
    public func canJump(_ nums: [Int]) -> Bool {
        let n = nums.count
        if n == 0 {
            return false
        }
        
        var f = [Bool](repeating: false, count: n)
        f[0] = true
        
        for i in 1..<n {
            for j in 0..<i {
                if f[j] && j + nums[j] >= i {
                    f[i] = true
                    break;
                }
            }
        }
        
        return f[n-1]
    }
}
