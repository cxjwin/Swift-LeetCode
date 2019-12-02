//
//  Problem844.swift
//  LeetCode
//
//  Created by smart on 2019/12/1.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem844 : Problem {
    public func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var stack = [Character]()
        
        let arrS = Array(S)
        let arrT = Array(T)
        
        for c in arrS {
            if c == "#" {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(c)
            }
        }
        
        var stack2 = [Character]()
        for c in arrT {
            if c == "#" {
                if !stack2.isEmpty {
                    stack2.removeLast()
                }
            } else {
                stack2.append(c)
            }
        }
        
        if stack.count != stack2.count {
            return false
        }
        
        for (i, c) in stack.enumerated() {
            let c2 = stack2[i]
            if c != c2 {
                return false
            }
        }
        
        return true
    }
    
    public func backspaceCompare2(_ S: String, _ T: String) -> Bool {
        // TODO: 
        return false
    }
}
