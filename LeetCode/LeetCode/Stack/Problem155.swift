//
//  Problem155.swift
//  LeetCode
//
//  Created by smart on 2019/12/1.
//  Copyright © 2019 smart. All rights reserved.
//

public class MinStack {
    
    var arr: [Int]
    var min: [Int]
    
    /** initialize your data structure here. */
    public init() {
        self.arr = [Int]()
        self.min = [Int]()
    }
    
    public func push(_ x: Int) {
        if let m = min.last {
            if x <= m {
                min.append(x)
            }
        } else {
            min.append(x)
        }
        arr.append(x)
    }
    
    public func pop() {
        let last = arr.removeLast()
        if let m = min.last {
            if m == last {
                min.removeLast()
            }
        }
    }
    
    public func top() -> Int {
        return arr.last!
    }
    
    public func getMin() -> Int {
        return min.last!
    }
}
