//
//  Problem152.swift
//  LeetCode
//
//  Created by smart on 2019/10/16.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem152: Problem {
    public func maxProduct(_ nums: [Int]) -> Int {
        /// containing at least one number
        
        let n = nums.count
        
        var maxP = nums[0]
        var minP = nums[0]
        var result = nums[0]
        
        for i in 1..<n {
            let a = nums[i] * maxP
            let b = nums[i] * minP
            
            maxP = max(nums[i], max(a, b))
            minP = min(nums[i], min(a, b))
            
            result = max(result, maxP)
        }
        
        return result
    }
}
