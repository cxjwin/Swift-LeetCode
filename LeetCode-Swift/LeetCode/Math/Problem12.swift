//
//  Problem12.swift
//  LeetCode
//
//  Created by smart on 2019/12/3.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem12 : Problem {
    func helper(_ s1: String, _ s2: String, _ s3: String, _ n: Int) -> String {
        var res = ""
        
        switch n {
        case 1..<4:
            for _ in 0..<n {
                res += s1
            }
        case 4:
            res += (s1 + s2)
        case 5:
            res += s2
        case 6..<9:
            res += s2
            for _ in 5..<n {
                res += s1
            }
        case 9:
            res += (s1 + s3)
        default:
            break
        }
        
        return res
    }
    
    public func intToRoman(_ num: Int) -> String {
        var res = ""
        
        var temp = num
        if temp >= 1000 {
            let n = temp / 1000
            for _ in 0..<n {
                res += "M"
            }
            temp = temp % 1000
        }
        
        if temp >= 100 {
            let n = temp / 100
            res += helper("C", "D", "M", n)
            temp = temp % 100
        }
        
        if temp >= 10 {
            let n = temp / 10
            res += helper("X", "L", "C", n)
            temp = temp % 10
        }
        
        res += helper("I", "V", "X", temp)
        
        return res
    }
}
