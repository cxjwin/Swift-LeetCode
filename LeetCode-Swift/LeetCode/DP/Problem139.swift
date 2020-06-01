//
//  Problem139.swift
//  LeetCode
//
//  Created by smart on 2019/10/12.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem139: Problem {
    public func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        if s.count == 0 {
            return false
        }
        
        if wordDict.count == 0 {
            return false
        }
        
        let set: Set<String> = Set(wordDict)
        
        let n = s.count
        var f = [Bool](repeating: false, count: n+1)
        f[0] = true
        
        for i in 1...n {
            for j in 0..<i {
                if f[j] {
                    let start = s.index(s.startIndex, offsetBy: j)
                    let end = s.index(s.startIndex, offsetBy: i)
                    let subStr = s[start..<end]
                    let tempStr = String(subStr)
                    if set.contains(tempStr) {
                        f[i] = true
                    }
                }
            }
        }
        
        return f[n]
    }
}
