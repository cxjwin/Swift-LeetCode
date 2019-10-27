//
//  LintCode563.swift
//  LeetCode
//
//  Created by smart on 2019/10/27.
//  Copyright © 2019 smart. All rights reserved.
//

public class LintCode563: Problem {
    public func backPackV(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        
        var f = [Int](repeating: 0, count: target+1)
        f[0] = 1
        
        for i in 1...n {
            for j in (nums[i-1]...target).reversed() {
                f[j] += f[j-nums[i-1]]
            }
        }
        
        return f[target]
    }
}
