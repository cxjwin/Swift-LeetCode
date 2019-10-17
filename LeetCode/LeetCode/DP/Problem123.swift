//
//  Problem123.swift
//  LeetCode
//
//  Created by smart on 2019/10/17.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem123: Problem {
    public func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        if prices.count <= 1 {
            return 0
        }
        
        var left = [Int](repeating: 0, count: n)
        var right = [Int](repeating: 0, count: n)
        
        // dp from left to right
        left[0] = 0
        var minP = prices[0]
        for i in 1..<n {
            minP = min(minP, prices[i])
            left[i] = max(left[i-1], prices[i] - minP)
        }
        
        // dp from right to left
        right[n-1] = 0
        var maxP = prices[n-1]
        for i in (0..<n-1).reversed() {
            maxP = max(maxP, prices[i])
            right[i] = max(right[i+1], maxP - prices[i])
        }
        
        var profit = 0
        for i in 0..<n {
            profit = max(profit, left[i] + right[i])
        }
        
        return profit
    }
}
