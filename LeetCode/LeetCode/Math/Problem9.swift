//
//  Problem9.swift
//  LeetCode
//
//  Created by smart on 2019/11/18.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem9: Problem {
    public func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x != 0 && x % 10 == 0) {
            return false
        }
        
        var num = x
        var rev = 0
        while num != 0 {
            rev = rev * 10 + (num % 10)
            num /= 10
        }
        
        return rev == x
    }
}
