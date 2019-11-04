//
//  LintCode564.swift
//  LeetCode
//
//  Created by smart on 2019/11/1.
//  Copyright © 2019 smart. All rights reserved.
//

public class LintCode564: Problem {
    public func backPackVI(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        
        var f = [Int](repeating: 0, count: target+1)
        f[0] = 1
        
        for i in 1...target {
            for num in nums {
                if num <= i {
                    f[i] += f[i-num]
                }
            }
        }
        
        return f[target]
    }
}
