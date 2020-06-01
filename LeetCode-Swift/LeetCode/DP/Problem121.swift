//
//  Problem121.swift
//  LeetCode
//
//  Created by smart on 2019/10/16.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem121: Problem {
    public func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        if n == 0 {
            return 0
        }
        
        var maxP = 0
        var minP = prices[0]
        
        for i in 1..<n {
            minP = min(minP, prices[i])
            maxP = max(maxP, prices[i] - minP)
        }
        
        return maxP
    }
}
