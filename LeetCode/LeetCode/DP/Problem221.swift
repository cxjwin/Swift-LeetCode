//
//  Problem221.swift
//  LeetCode
//
//  Created by smart on 2019/10/12.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem221: Problem {
    public func maximalSquare(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 || matrix[0].count == 0 {
            return 0
        }
        
        let m = matrix.count
        let n = matrix[0].count
        
        var f = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        f[0][0] = matrix[0][0] == "1" ? 1 : 0
        var result = f[0][0]
        
        for i in 1..<m {
            f[i][0] = matrix[i][0] == "1" ? 1 : 0
            result = max(f[i][0], result)
        }
        for j in 1..<n {
            f[0][j] = matrix[0][j] == "1" ? 1 : 0
            result = max(f[0][j], result)
        }
        
        for i in 1..<m {
            for j in 1..<n {
                if matrix[i][j] == "1" {
                    f[i][j] = min(f[i-1][j-1], min(f[i-1][j], f[i][j-1])) + 1
                    result = max(f[i][j], result)
                } else {
                    f[i][j] = 0
                }
            }
        }
        
        return result * result
    }
}
