//
//  Problem188.swift
//  LeetCode
//
//  Created by smart on 2019/10/17.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem188: Problem {
    func maxProfitN(_ k: Int, _ prices: [Int]) -> Int {
        var profit = 0
        for i in 1..<prices.count {
            let diff = prices[i] - prices[i-1]
            if diff > 0 {
                profit += diff
            }
        }
        return profit
    }
    
    public func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        if n == 0 {
            return 0
        }
        if k >= prices.count / 2 {
            return maxProfitN(k, prices)
        }
        
        var f = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0,
                                                              count: 2),
                                             count: k+1),
                          count: n)
        for j in 0...k {
            f[0][j][0] = 0
            f[0][j][1] = -prices[0]
        }
        
        for i in 1..<n {
            for j in 0...k {
                if j == 0 {
                    f[i][j][0] = f[i-1][j][0]
                } else {
                    f[i][j][0] = max(f[i-1][j][0], f[i-1][j-1][1] + prices[i])
                }
                f[i][j][1] = max(f[i-1][j][1], f[i-1][j][0] - prices[i])
            }
        }
        
        var profit = f[n-1][0][0]
        for j in 1...k {
            profit = max(profit, f[n-1][j][0])
        }
        
        return profit
    }
}
