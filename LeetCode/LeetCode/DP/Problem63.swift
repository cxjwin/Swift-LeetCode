//
//  Problem63.swift
//  LeetCode
//
//  Created by smart on 2019/10/4.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem63: Problem {
    public func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        
        if obstacleGrid.count == 0 || obstacleGrid.first?.count == 0 {
            return 0
        }
        
        let m = obstacleGrid.count
        let n = obstacleGrid.first!.count
        
        var d = [[Int]]()
        for _ in obstacleGrid {
            d.append([Int](repeating: 0, count: n))
        }
        d[0][0] = obstacleGrid[0][0] == 1 ? 0 : 1
        
        for i in 1..<m {
            d[i][0] = obstacleGrid[i][0] == 1 ? 0 : d[i-1][0]
        }
        for j in 1..<n {
            d[0][j] = obstacleGrid[0][j] == 1 ? 0 : d[0][j-1]
        }
        for i in 1..<m {
            for j in 1..<n {
                if obstacleGrid[i][j] == 1 {
                    d[i][j] = 0
                } else {
                    d[i][j] = d[i-1][j] + d[i][j-1]
                }
            }
        }
        
        return d[m-1][n-1]
    }
}
