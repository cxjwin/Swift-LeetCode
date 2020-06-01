//
//  Problem6.swift
//  LeetCode
//
//  Created by smart on 2019/11/7.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem6: Problem {
    public func convert(_ s: String, _ numRows: Int) -> String {
        if numRows < 2 {
            return s
        }
        
        let arr = Array(s)
        let n = arr.count
        let g = numRows + (numRows - 2)
        
        let part = n / g + ( n % g == 0 ? 0 : 1)
        
        var res = [String](repeating: "", count: numRows)
        
        for k in 0..<part {
            // 0
            var idx = 0
            res[idx] += String(arr[k*g]);
            idx += 1
            
            // 1 to "g-1"
            var i = 1
            var j = g - 1
            while i <= j {
                if k*g+i < n {
                    res[idx] += String(arr[k*g+i])
                }
                if i != j {
                    if k*g+j < n {
                        res[idx] += String(arr[k*g+j])
                    }
                }
                idx += 1
                i += 1
                j -= 1
            }
        }
        
        var str = ""
        for row in res {
            str += row
        }
        
        return str;
    }
}
