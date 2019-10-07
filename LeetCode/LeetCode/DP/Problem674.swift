//
//  Problem674.swift
//  LeetCode
//
//  Created by smart on 2019/10/6.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem674: Problem {
    public func findLengthOfLCIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        let n = nums.count
        var pre = 1
        var cur = pre
        
        var res = cur
        for i in 1..<n {
            if nums[i] > nums[i-1] {
                cur = pre + 1
            } else {
                cur = 1
            }
            res = max(res, cur)
            pre = cur
        }
        
        return res
    }
}
