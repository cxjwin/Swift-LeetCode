//
//  LintCode125.swift
//  LeetCode
//
//  Created by smart on 2019/10/25.
//  Copyright © 2019 smart. All rights reserved.
//

public class LintCode125: Problem {
    public func backPackII(_ m: Int, _ A: [Int], _ V: [Int]) -> Int {
        let n = A.count
        
        var f = [Int](repeating: 0, count: m+1)
        
        for i in 1...n {
            let c = A[i-1]
            let v = V[i-1]
            for j in (c...m).reversed() {
                f[j] = max(f[j], f[j-c] + v)
            }
        }
        
        return f[m]
    }
}
