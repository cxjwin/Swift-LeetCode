//
//  Problem213.swift
//  LeetCode
//
//  Created by smart on 2019/10/14.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem213: Problem {
    func helper(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        let n = end - start
        var f = [Int](repeating: 0, count: n+1)
        f[1] = nums[start]
        
        if n >= 2 {
            for i in 2...n {
                f[i] = max(f[i-1], f[i-2] + nums[start+i-1])
            }
        }
        
        return f[n]
    }
    
    
    public func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        if n == 1 {
            return nums[0]
        }
        
        return max(helper(nums, 0, n-1), helper(nums, 1, n))
    }
}
