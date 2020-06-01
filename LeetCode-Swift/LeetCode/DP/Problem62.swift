//
//  Problem62.swift
//  LeetCode
//
//  Created by smart on 2019/10/2.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem62 : Problem {
    
    public func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 {
            return 0
        }
        
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 || j == 0 {
                    res[i][j] = 1
                } else {
                    res[i][j] = res[i-1][j] + res[i][j-1]
                }
            }
        }
        
        return res[m-1][n-1]
    }
    
}
