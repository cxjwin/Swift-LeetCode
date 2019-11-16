//
//  Problem7.swift
//  LeetCode
//
//  Created by smart on 2019/11/12.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem7: Problem {
    public func reverse(_ x: Int32) -> Int32 {
        let isNegative = x < 0
        
        var absX = x
        if isNegative {
            absX = -x
        }
        
        if absX < 10 {
            return x
        }
        
        var num = absX
        var d: Int32 = 1
        while num / 10 > 0 {
            d *= 10
            num /= 10
        }
        
        num = absX
        var arr = [Int32]()
        while d > 0 {
            let temp = num / d
            arr.append(temp)
            num -= (d * temp)
            d /= 10
        }
        
        d = 1
        var res: Int64 = 0
        for i in 0..<arr.count {
            res += Int64(arr[i]) * Int64(d)
            d *= 10
        }
        
        if res > Int64(Int32.max) {
            return 0
        }
        
        return Int32(isNegative ? -res : res)
    }
}
