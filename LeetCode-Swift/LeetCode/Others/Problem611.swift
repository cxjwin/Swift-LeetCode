//
//  Problem611.swift
//  LeetCode
//
//  Created by smart on 2019/10/18.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem611: Problem {
    public func triangleNumber(_ nums: [Int]) -> Int {
        // 1. The length of the given array won't exceed 1000.
        // 2. The integers in the given array are in the range of [0, 1000].
        
        let n = nums.count
        if n < 3 {
            return 0
        }
        
        var count = 0
        
        for i in 0..<n-2 {
            let a = nums[i]
            for j in i+1..<n-1 {
                let b = nums[j]
                for k in j+1..<n {
                    let c = nums[k]
                    if a+b > c && a+c > b && b+c > a {
                        count += 1
                    }
                }
            }
        }
        
        return count
    }
    
    public func triangleNumberSort(_ nums: [Int]) -> Int {
        // 1. The length of the given array won't exceed 1000.
        // 2. The integers in the given array are in the range of [0, 1000].
        
        let n = nums.count
        if n < 3 {
            return 0
        }
        
        let sortNums = nums.sorted()
        
        var count = 0
        for i in (2..<n).reversed() {
            var l = 0
            var r = i-1
            while l < r {
                if sortNums[l] + sortNums[r] > sortNums[i] {
                    count += (r-l)
                    r -= 1
                } else {
                    l += 1
                }
            }
        }
        
        return count
    }
}
