//
//  Problem72.swift
//  LeetCode
//
//  Created by smart on 2019/10/15.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem72: Problem {
    public func minDistance(_ word1: String, _ word2: String) -> Int {
        let m = word1.count
        let n = word2.count
        
        if m == 0 {
            return n
        }
        if n == 0 {
            return m
        }
        
        let arr1 = Array(word1)
        let arr2 = Array(word2)
        
        var f = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: m+1)
        f[0][0] = 0
        for i in 1...m {
            f[i][0] = i
        }
        for j in 1...n {
            f[0][j] = j
        }
        
        for i in 1...m {
            for j in 1...n {
                if arr1[i-1] == arr2[j-1] {
                    f[i][j] = f[i-1][j-1]
                } else {
                    f[i][j] = min(min(f[i-1][j], f[i][j-1]), f[i-1][j-1]) + 1
                }
            }
        }
        
        return f[m][n]
    }
}
