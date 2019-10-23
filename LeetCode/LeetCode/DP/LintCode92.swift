//
//  LintCode92.swift
//  LeetCode
//
//  Created by smart on 2019/10/23.
//  Copyright © 2019 smart. All rights reserved.
//

public class LintCode92: Problem {
    public func backPack(_ m: Int, _ A: [Int]) -> Int {
        let n = A.count
        
        var f = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
        
        for i in 1...n {
            for j in 1...m {
                f[i][j] = f[i-1][j]
                if j >= A[i-1] {
                    f[i][j] = max(f[i-1][j], f[i-1][j-A[i-1]] + A[i-1])
                }
            }
        }
        
        return f[n][m]
    }
    
    public func backPack2(_ m: Int, _ A: [Int]) -> Int {
        let n = A.count
        
        var f = [Int](repeating: 0, count: m+1)
        
        for i in 1...n {
            for j in (1...m).reversed() {
                if j >= A[i-1] {
                    f[j] = max(f[j], f[j-A[i-1]] + A[i-1])
                }
            }
        }
        
        return f[m]
    }
    
}
