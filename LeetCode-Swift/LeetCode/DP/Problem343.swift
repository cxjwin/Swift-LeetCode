//
//  Problem343.swift
//  LeetCode
//
//  Created by smart on 2019/10/14.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem343: Problem {
    public func integerBreak(_ n: Int) -> Int {
        let nums = [0, 0, 1, 2, 4, 6, 9]
        if n <= 6 {
            return nums[n]
        }
        
        var res = 1
        var i = n
        while i > 6 {
            i -= 3
            res *= 3
        }
        
        return res * nums[i]
    }
}
