//
//  Problem115.swift
//  LeetCode
//
//  Created by smart on 2019/10/15.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem115: Problem {
    public func numDistinct(_ s: String, _ t: String) -> Int {
        let m = s.count
        let n = t.count
        
        if m == 0 && n == 0 {
            return 1
        }
        if m < n {
            return 0
        }
        
        let a1 = Array(s)
        let a2 = Array(t)
        
        var f = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: m+1)
        for i in 0...m {
            f[i][0] = 1
        }
        
        for i in 1...m {
            for j in 1...n {
                if a1[i-1] == a2[j-1] {
                    f[i][j] = f[i-1][j-1] + f[i-1][j]
                } else {
                    f[i][j] = f[i-1][j]
                }
            }
        }
        
        return f[m][n]
    }
}
