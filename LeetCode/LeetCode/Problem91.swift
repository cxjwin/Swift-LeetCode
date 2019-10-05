//
//  Problem91.swift
//  LeetCode
//
//  Created by smart on 2019/10/5.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem91: Problem {
    public func numDecodings(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        let arr = Array(s)
        
        let n = arr.count
        var d = [Int](repeating: 0, count: n)
        d[0] = arr[0].asciiValue! - 48 == 0 ? 0 : 1
        
        for i in 1..<n {
            let c1 = arr[i].asciiValue! - 48
            if 1 <= c1 && c1 <= 9 {
                d[i] = d[i-1]
            }
            
            let c0 = arr[i-1].asciiValue! - 48
            let c2 = c0 * 10 + c1
            if 10 <= c2 && c2 <= 26 {
                if i > 1 {
                    d[i] += d[i-2]
                } else {
                    d[i] += 1
                }
            }
        }
        
        return d[n-1]
    }
}
