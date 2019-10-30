//
//  Problem132.swift
//  LeetCode
//
//  Created by smart on 2019/10/30.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem132: Problem {
    public func minCut(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        let arr = Array(s)
        let n = arr.count
        
        var isPalindromic = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)
        
        for t in 0...n {
            // odd
            var i = t
            var j = t
            while i >= 0 && j < n && arr[i] == arr[j] {
                isPalindromic[i][j] = true
                i -= 1
                j += 1
            }
            
            // even
            i = t
            j = t+1
            while i >= 0 && j < n && arr[i] == arr[j] {
                isPalindromic[i][j] = true
                i -= 1
                j += 1
            }
        }
        
        var f = [Int](repeating: 0, count: n+1)
        
        
        for i in 1...n {
            f[i] = Int.max
            for j in 0..<i {
                if isPalindromic[j][i-1] {
                    f[i] = min(f[i], f[j] + 1)
                }
            }
        }

        return f[n] - 1
    }
}
