//
//  LintCode437.swift
//  LeetCode
//
//  Created by smart on 2019/10/31.
//  Copyright © 2019 smart. All rights reserved.
//

public class LintCode437: Problem {
    public func copyBooks(_ pages: [Int], _ k: Int) -> Int {
        let n = pages.count
        if n == 0 {
            return 0
        }
        
        var kk = k
        if k > n {
            kk = n
        }
        
        var f = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: kk+1)
        f[0][0] = 0
        
        for i in 1...n {
            f[0][i] = Int.max
        }

        var sum = 0
        for t in 1...kk {
            f[t][0] = 0
            for i in 1...n {
                f[t][i] = Int.max
                sum = 0
                for j in (0...i).reversed() {
                    f[t][i] = min(f[t][i], max(f[t-1][j], sum))
                    if j > 0 {
                        sum += pages[j-1]
                    }
                }
            }
        }
        
        return f[kk][n]
    }
}
