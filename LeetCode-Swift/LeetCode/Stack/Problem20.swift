//
//  Problem20.swift
//  LeetCode
//
//  Created by smart on 2019/12/1.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem20 : Problem {
    public func isValid(_ s: String) -> Bool {
        if (s.count == 0) {
            return true
        }
        
        let arr = Array(s)
        var stack = [Character]()
        
        for c in arr {
            if c == "(" || c == "[" || c == "{" {
                stack.append(c)
            } else {
                let last = stack.last
                if (last == "(" && c == ")") ||
                   (last == "[" && c == "]") ||
                   (last == "{" && c == "}") {
                    stack.removeLast()
                } else  {
                    return false
                }
            }
        }
        
        return (stack.count == 0)
    }
}
