//
//  Problem256.swift
//  LeetCode
//
//  Created by smart on 2019/10/5.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem256: Problem {
    public func minCost(_ costs: [[Int]]) -> Int {
        
        if costs.count == 0 {
            return 0
        }
        
        let n = costs.count
        
        var d = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n+1)
        for i in 0..<3 {
            d[0][i] = 0
        }
        
        for i in 1...n {
            for j in 0..<3 {
                d[i][j] = Int.max
                for k in 0..<3 {
                    if k != j {
                        d[i][j] = min(d[i][j], d[i-1][k] + costs[i-1][j])
                    }
                }
            }
        }
        
        var res = Int.max
        for i in 0..<3 {
            res = min(res, d[n][i])
        }
        
        return res
    }
}
