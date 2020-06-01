//
//  Problem140.swift
//  LeetCode
//
//  Created by smart on 2019/10/12.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem140: Problem {
    // DFS
    func genPath(_ s: String, _ prev: [[Bool]], _ cur: Int, _ path: inout [String], _ result: inout [String]) {
        if cur == 0 {
            let str = path.reversed().joined(separator: " ")
            result.append(str)
            return
        }
        
        for i in 0..<s.count {
            if prev[cur][i] {
                // i 是 start, cur 是 end
                let start = s.index(s.startIndex, offsetBy: i)
                let end = s.index(s.startIndex, offsetBy: cur)
                let subStr = s[start..<end]
                let tempStr = String(subStr)
                
                path.append(tempStr)
                genPath(s, prev, i, &path, &result)
                path.removeLast()
            }
        }
    }
    
    public func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        
        if s.count == 0 {
            return [String]()
        }
        
        if wordDict.count == 0 {
            return [String]()
        }
        
        let set = Set(wordDict)
        
        let n = s.count

        var f = [Bool](repeating: false, count: n+1)
        var prev = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n+1)
        
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
                        prev[i][j] = true
                    }
                }
            }
        }
        
        var path = [String]()
        var result = [String]()
        
        genPath(s, prev, n, &path, &result)
        
        return result
    }
}
