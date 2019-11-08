//
//  Heap.swift
//  LeetCode
//
//  Created by smart on 2019/11/8.
//  Copyright © 2019 smart. All rights reserved.
//

public struct Heap<T> {
    var nodes = [T]()
    
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
    
    public func allNodes() -> [T] {
        return nodes
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
    
    public func count() -> Int {
        return nodes.count
    }
    
    public func peek() -> T? {
        return nodes.first
    }
    
    public mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(of: index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index
        if leftChildIndex < endIndex && priorityFunction(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && priorityFunction(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index {
            return
        }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    public mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}
