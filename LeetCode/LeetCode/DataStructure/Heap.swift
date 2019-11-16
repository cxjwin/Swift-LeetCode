//
//  Heap.swift
//  LeetCode
//
//  Created by smart on 2019/11/8.
//  Copyright © 2019 smart. All rights reserved.
//

public struct Heap<T> {
    var nodes = [T]()
    
    public var allNodes: [T] {
        get {
            return nodes
        }
    }
    
    public var count: Int {
        get {
            return nodes.count
        }
    }
    
    public var isEmpty: Bool {
        get {
            return nodes.isEmpty
        }
    }
    
    let priorityFunction: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.priorityFunction = sort;
    }
    
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.priorityFunction = sort
        configureHeap(from: array)
    }
    
    private mutating func configureHeap(from array: [T]) {
      nodes = array
      for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
        shiftDown(i)
      }
    }
    
    @inline(__always) internal func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    @inline(__always) internal func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    @inline(__always) internal func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    public func peek() -> T? {
        return nodes.first
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(from: nodes.count - 1)
    }
    
    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    public mutating func shiftUp(from index: Int) {
        if index == 0 {
            return
        }
        
        var i = index
        while i > 0 {
            let parent = parentIndex(of: i)
            if priorityFunction(nodes[parent], nodes[i]) {
                break
            }
            nodes.swapAt(i, parent)
            i = parent
        }
    }
    
    public mutating func shiftDown(from index: Int, until endIndex: Int) {
        var i = index
        while true {
            let left = leftChildIndex(of: i)
            let right = left + 1
            
            var first = i
            if left < endIndex && priorityFunction(nodes[left], nodes[first]) {
                first = left
            }
            if right < endIndex && priorityFunction(nodes[right], nodes[first]) {
                first = right
            }
            if first == i {
                break
            }
            
            nodes.swapAt(i, first)
            i = first
        }
    }
    
    public mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}
