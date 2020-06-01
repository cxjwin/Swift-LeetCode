//
//  Problem7.swift
//  LeetCode
//
//  Created by smart on 2019/11/12.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem7: Problem {
    public func reverse(_ x: Int) -> Int {
        var num = x
        
        var rev = 0
        while num != 0 {
            let temp = num % 10
            
            if x < 0 {
                if rev < Int(Int32.min / 10) || (rev == Int(Int32.min / 10) && temp < -8) {
                    return 0
                }
            } else {
                if rev > Int(Int32.max / 10) || (rev == Int(Int32.max / 10) && temp > 7) {
                    return 0
                }
            }
            
            rev = rev * 10 + temp
            num /= 10
        }
        
        return rev
    }
}
