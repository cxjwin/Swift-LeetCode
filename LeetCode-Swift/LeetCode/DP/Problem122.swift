//
//  Problem122.swift
//  LeetCode
//
//  Created by smart on 2019/10/16.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem122: Problem {
    public func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        
        var profit = 0
        for i in 1..<prices.count {
            let diff = prices[i] - prices[i-1]
            if diff > 0 {
                profit += diff
            }
        }
        
        return profit
    }
}
