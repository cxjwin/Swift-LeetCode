//
//  Problem45.swift
//  LeetCode
//
//  Created by smart on 2019/10/11.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem45: Problem {
    public func jump(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        
        var steps = [Int](repeating: 0, count: n)
        
        for i in 1..<n {
            steps[i] = Int.max
            for j in 0..<i {
                if steps[j] != Int.max && j + nums[j] >= i {
                    steps[i] = steps[j] + 1
                    break;
                }
            }
        }
        
        return steps[n-1]
    }
    
    public func jumpGreedy(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        
        var minStep = 0
        var maxDis = 0
        var last = 0
        
        for i in 1..<n {
            if i > last {
                last = maxDis
                minStep += 1
            }
            maxDis = max(maxDis, i + nums[i])
        }
        
        return minStep
    }
}
