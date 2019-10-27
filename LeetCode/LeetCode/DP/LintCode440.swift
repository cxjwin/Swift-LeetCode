//
//  LintCode440.swift
//  LeetCode
//
//  Created by smart on 2019/10/27.
//  Copyright © 2019 smart. All rights reserved.
//

public class LintCode440: Problem {
    public func backPackIII(_ m: Int, _ A: [Int], _ V: [Int]) -> Int {
        // F[i,v] = max(F[i − 1,v],F[i,v − Ci] + Wi)
        
        let n = A.count
        
        var f = [Int](repeating: 0, count: m+1)
        
        for i in 1...n {
            for j in A[i-1]...m {
                f[j] = max(f[j], f[j-A[i-1]] + V[i-1])
            }
        }
        
        return f[m]
    }
}
