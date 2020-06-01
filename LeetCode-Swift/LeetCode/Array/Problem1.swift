//
//  Problem1.swift
//  LeetCode
//
//  Created by smart on 2019/12/11.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem1 : Problem {
    public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let sorted = nums.sorted()
        let count = sorted.count
        
        var i = 0
        var j = count - 1
        
        while i < j {
            let sum = sorted[i] + sorted[j]
            if sum == target {
                break;
            }
            if sum < target {
                i += 1
            } else {
                j -= 1
            }
        }
        
        if i < j {
            var arr = [Int]()
            for (idx, v) in nums.enumerated() {
                if v == sorted[i] && arr.count == 0 {
                    arr.append(idx)
                }
                if v == sorted[j] && arr.count == 1 {
                    arr.append(idx)
                }
            }
            return arr
        }
        
        return [-1, -1]
    }
}
