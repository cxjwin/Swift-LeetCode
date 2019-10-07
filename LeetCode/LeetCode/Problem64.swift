//
//  Problem64.swift
//  LeetCode
//
//  Created by smart on 2019/10/6.
//  Copyright © 2019 smart. All rights reserved.
//

/// https://leetcode.com/problems/minimum-path-sum/

public class Problem64: Problem {
    public func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.count == 0 || grid[0].count == 0{
            return 0
        }
        
        let m = grid.count
        let n = grid[0].count
        
        var d = [Int](repeating: 0, count: n)
        d[0] = grid[0][0]
        for j in 1..<n {
            d[j] = d[j-1] + grid[0][j]
        }
        
        for i in 1..<m {
            d[0] = (d[0] + grid[i][0])
            for j in 1..<n {
                        // d[j] -> up, d[j-1] -> left
                d[j] = min(d[j], d[j-1]) + grid[i][j]
            }
        }
        
        return d[n-1]
    }
}
