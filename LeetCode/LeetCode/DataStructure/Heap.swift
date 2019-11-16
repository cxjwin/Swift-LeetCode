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
    
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else {
            return nil
        }
        
        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(from: index)
        }
        return nodes.removeLast()
    }
    
    fileprivate mutating func shiftUp(from index: Int) {
        var i = index
        while true {
            let parentIdx = parentIndex(of: i)
            if parentIdx > 0 && priorityFunction(nodes[i], nodes[parentIdx]) {
                nodes.swapAt(i, parentIdx)
            } else {
                break
            }
            i = parentIdx
        }
    }
    
    fileprivate mutating func shiftDown(from index: Int, until endIndex: Int) {
        var i = index
        while true {
            var maxPos = i
            
            let leftChildIdx = leftChildIndex(of: maxPos)
            let rightChildIdx = leftChildIdx + 1
            
            if leftChildIdx < endIndex && priorityFunction(nodes[leftChildIdx], nodes[maxPos]) {
                maxPos = leftChildIdx
            }
            if rightChildIdx < endIndex && priorityFunction(nodes[rightChildIdx], nodes[maxPos]) {
                maxPos = rightChildIdx
            }
            if maxPos == i {
                break
            }
            
            nodes.swapAt(maxPos, index)
            i = maxPos
        }
    }
    
    public mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}

