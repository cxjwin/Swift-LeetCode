//
//  Problem821.swift
//  LeetCode
//
//  Created by smart on 2019/11/5.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem821: Problem {
    public func shortestToChar(_ S: String, _ C: Character) -> [Int] {
        let arr = Array(S)
        let n = arr.count
        
        var res = [Int](repeating: 0, count: n)
        
        var last = Int.max
        for i in 0..<n {
            if arr[i] == C {
                res[i] = 0
                last = i
            } else {
                res[i] = last == Int.max ? Int.max : i - last
            }
        }
        
        last = Int.max
        for i in (0..<n).reversed() {
            if res[i] == 0 {
                last = i
            } else {
                let temp = last == Int.max ? Int.max : last - i
                res[i] = min(res[i], temp)
            }
        }
        
        return res
    }
}
