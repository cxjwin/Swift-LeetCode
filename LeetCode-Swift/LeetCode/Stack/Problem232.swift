//
//  Problem232.swift
//  LeetCode
//
//  Created by smart on 2019/12/1.
//  Copyright © 2019 smart. All rights reserved.
//

class MyStack {
    
    var arr: [Int]
    
    init() {
        self.arr = [Int]()
    }
    
    func size() -> Int {
        return arr.count
    }
    
    func peek() -> Int {
        return arr.last!
    }
    
    func push(_ x: Int) {
        arr.append(x)
    }
    
    func pop() -> Int {
        return arr.removeLast()
    }
    
    func empty() -> Bool {
        return arr.isEmpty
    }
}

public class MyQueue {

    var stack1: MyStack
    var stack2: MyStack
    
    /** Initialize your data structure here. */
    public init() {
        self.stack1 = MyStack()
        self.stack2 = MyStack()
    }
    
    /** Push element x to the back of queue. */
    public func push(_ x: Int) {
        stack1.push(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    public func pop() -> Int {
        if !stack2.empty() {
            return stack2.pop()
        }
        
        while !stack1.empty() {
            let e = stack1.pop()
            stack2.push(e)
        }
        return stack2.pop()
    }
    
    /** Get the front element. */
    public func peek() -> Int {
        if !stack2.empty() {
            return stack2.peek()
        }
        
        while !stack1.empty() {
            let e = stack1.pop()
            stack2.push(e)
        }
        return stack2.peek()
    }
    
    /** Returns whether the queue is empty. */
    public func empty() -> Bool {
        return stack1.empty() && stack2.empty()
    }
}

