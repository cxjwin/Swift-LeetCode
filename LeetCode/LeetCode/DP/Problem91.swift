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
        
        var d = [Int](repeating: 0, count: n+1)
        d[0] = 1 // "" have one decode way
        d[1] = arr[0].asciiValue! - 48 == 0 ? 0 : 1
        
        if n >= 2 {
            for i in 2...n {
                // one digit
                let c1 = arr[i-1].asciiValue! - 48
                if 1 <= c1 && c1 <= 9 {
                    d[i] = d[i-1]
                }
                
                // two digits
                let c0 = arr[i-2].asciiValue! - 48
                let c2 = c0 * 10 + c1
                if 10 <= c2 && c2 <= 26 {
                    d[i] += d[i-2]
                }
            }
        }
        
        return d[n]
    }
}
