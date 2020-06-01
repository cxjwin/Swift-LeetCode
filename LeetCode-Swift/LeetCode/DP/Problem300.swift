//
//  Problem300.swift
//  LeetCode
//
//  Created by smart on 2019/10/11.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem300: Problem {
    public func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        
        var f = [Int](repeating: 0, count: n)
        f[0] = 1
        
        for i in 1..<n {
            if nums[i] > nums[i-1] {
                f[i] = f[i-1] + 1
            } else {
                f[i] = f[i-1]
            }
        }
        
        return f[n-1]
    }
}
