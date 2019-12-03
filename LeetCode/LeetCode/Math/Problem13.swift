//
//  Problem13.swift
//  LeetCode
//
//  Created by smart on 2019/12/4.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem13 : Problem {
    public func romanToInt(_ s: String) -> Int {
        let double = ["IV" : 4, "IX" : 9, "XL" : 40, "XC" : 90, "CD" : 400, "CM" : 900]
        let single = ["I" : 1, "V" : 5, "X" : 10, "L" : 50, "C" : 100, "D" : 500, "M" : 1000]
        
        let arr = Array(s)
        var sum = 0
        
        var n = arr.count
        
        while n > 0 {
            if n > 1 {
                let d = String(arr[n-2]) + String(arr[n-1])
                if let v = double[d] {
                    sum += v
                    n -= 2
                    continue
                }
            }
            
            let s = String(arr[n-1])
            if let v = single[s] {
                sum += v
            }
            n -= 1
        }
        
        return sum
    }
}
