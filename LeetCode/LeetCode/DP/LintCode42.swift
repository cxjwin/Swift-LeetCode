//
//  LintCode42.swift
//  LeetCode
//
//  Created by smart on 2019/10/18.
//  Copyright © 2019 smart. All rights reserved.
//

public class LintCode42: Problem {
    public func maxTwoSubArrays(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        
        // from left to right
        var leftLocal = [Int](repeating: 0, count: n)
        var leftGlobal = [Int](repeating: 0, count: n)
        leftLocal[0] = nums[0]
        leftGlobal[0] = nums[0]
        for i in 1..<n {
            leftLocal[i] = max(leftLocal[i-1] + nums[i], nums[i])
            leftGlobal[i] = max(leftGlobal[i-1], leftLocal[i])
        }
        
        // from right to left
        var rightLocal = [Int](repeating: 0, count: n)
        var rightGlobal = [Int](repeating: 0, count: n)
        rightLocal[n-1] = nums[n-1]
        rightGlobal[n-1] = nums[n-1]
        for i in (1..<n-1).reversed() {
            rightLocal[i] = max(rightLocal[i+1] + nums[i], nums[i])
            rightGlobal[i] = max(rightGlobal[i+1], rightLocal[i])
        }
        
        var maxSum = 0
        for i in 1..<n {
            maxSum = max(maxSum, leftGlobal[i-1] + rightGlobal[i])
        }
        
        return maxSum
    }
    
    public func maxTwoSubArrays2(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        
        var left = [Int](repeating: 0, count: n)
        var right = [Int](repeating: 0, count: n)
        
        // from left to right
        var totalSum = 0
        var minSum = 0
        var maxSum = Int.min
        for i in 0..<n {
            totalSum += nums[i]
            maxSum = max(maxSum, totalSum - minSum)
            minSum = min(minSum, totalSum)
            left[i] = maxSum
        }
        
        // from right to left
        totalSum = 0
        minSum = 0
        maxSum = Int.min
        for i in (0..<n).reversed() {
            totalSum += nums[i]
            maxSum = max(maxSum, totalSum - minSum)
            minSum = min(minSum, totalSum)
            right[i] = maxSum
        }
        
        maxSum = Int.min
        for i in 1..<n {
            maxSum = max(maxSum, left[i-1] + right[i])
        }
        
        return maxSum
    }

}
