//
//  Problem322.swift
//  LeetCode
//
//  Created by smart on 2019/10/1.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem322 : Problem {
    
    public func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var res = [Int](repeating: 0, count: amount+1)
        
        if amount > 0 {
            for i in 1...amount {
                res[i] = Int.max
                for coin in coins {
                    if i >= coin && res[i-coin] != Int.max {
                        res[i] = min(res[i], res[i-coin] + 1)
                    }
                }
            }
        }
        return res[amount] == Int.max ? -1 : res[amount]
    }
    
}
