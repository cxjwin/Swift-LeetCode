//
//  Problem1143.swift
//  LeetCode
//
//  Created by smart on 2019/10/15.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem1143: Problem {
    public func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text1.count == 0 || text2.count == 0 {
            return 0
        }
        
        let arr1 = Array(text1)
        let arr2 = Array(text2)
        
        let m = arr1.count
        let n = arr2.count
        
        var f = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: m+1)
        
        for i in 1...m {
            for j in 1...n {
                if arr1[i-1] == arr2[j-1] {
                    f[i][j] = f[i-1][j-1] + 1
                } else {
                    f[i][j] = max(f[i-1][j], f[i][j-1])
                }
            }
        }
        
        return f[m][n]
    }
}
