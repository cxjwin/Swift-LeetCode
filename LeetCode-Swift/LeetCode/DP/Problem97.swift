//
//  Problem97.swift
//  LeetCode
//
//  Created by smart on 2019/10/15.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem97: Problem {
    public func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let m = s1.count
        let n = s2.count
        let t = s3.count
        
        if m + n != t {
            return false
        }
        if m == 0 && n == 0 && t == 0 {
            return true
        }
        if m == 0 {
            return s2 == s3
        }
        if n == 0 {
            return s1 == s3
        }
        
        let a1 = Array(s1)
        let a2 = Array(s2)
        let a3 = Array(s3)
        
        var f = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: m+1)
        
        f[0][0] = true
        for i in 1...m {
            f[i][0] = f[i-1][0] && a1[i-1] == a3[i-1]
        }
        for j in 1...n {
            f[0][j] = f[0][j-1] && a2[j-1] == a3[j-1]
        }
        
        for i in 1...m {
            for j in 1...n {
                if (f[i-1][j] && a1[i-1] == a3[i+j-1])
                    || (f[i][j-1] && a2[j-1] == a3[i+j-1]) {
                    f[i][j] = true
                } else {
                    f[i][j] = false
                }
            }
        }
        
        return f[m][n]
    }
}
