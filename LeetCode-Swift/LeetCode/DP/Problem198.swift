//
//  Problem198.swift
//  LeetCode
//
//  Created by smart on 2019/10/14.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem198: Problem {
    public func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        
        var f = [Int](repeating: 0, count: n+1)
        f[1] = nums[0]
        
        if n >= 2 {
            for i in 2...n {
                f[i] = max(f[i-1], f[i-2] + nums[i-1])
            }
        }
        
        return f[n]
    }
}
