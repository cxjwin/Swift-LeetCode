//
//  LintCode513.swift
//  LeetCodeTests
//
//  Created by smart on 2019/10/29.
//  Copyright © 2019 smart. All rights reserved.
//

public class LintCode513: Problem {
    public func numSquares(_ n: Int) -> Int {
        var f = [Int](repeating: 0, count: n+1)
        f[0] = 0
        
        for i in 1...n {
            f[i] = Int.max
            var j = 1
            while j * j <= i {
                f[i] = min(f[i], f[i-j*j] + 1)
                j += 1
            }
        }
        
        return f[n]
    }
}
