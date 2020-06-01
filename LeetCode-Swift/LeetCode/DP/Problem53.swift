//
//  Problem53.swift
//  LeetCode
//
//  Created by smart on 2019/10/15.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem53: Problem {
    public func maxSubArray1(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        
        var local = [Int](repeating: 0, count: n)
        var globbal = [Int](repeating: 0, count: n)
        
        local[0] = nums[0]
        globbal[0] = nums[0]
        
        for i in 1..<n {
            local[i] = max(nums[i], local[i-1] + nums[i])
            globbal[i] = max(globbal[i-1], local[i])
        }
        
        return globbal[n-1]
    }
    
    public func maxSubArray2(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        
        var preSum = nums[0]
        var maxSum = preSum
        
        for i in 1..<n {
            preSum = max(nums[i], preSum + nums[i])
            maxSum = max(maxSum, preSum)
        }
        
        return maxSum
    }
    
    public func maxSubArray3(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        
        var preSum = nums[0]
        var maxSum = preSum
        
        for i in 1..<n {
            if preSum > 0 {
                preSum += nums[i]
            } else {
                preSum = nums[i]
            }
            maxSum = max(maxSum, preSum)
        }
        
        return maxSum
    }
    
    public func maxSubArray4(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
           return 0
        }
       
        var sum = 0
        var maxSum = Int.min
        var minSum = 0
        
        for num in nums {
            sum += num
            maxSum = max(maxSum, sum - minSum)
            minSum = min(minSum, sum)
        }

        return maxSum
    }
}
