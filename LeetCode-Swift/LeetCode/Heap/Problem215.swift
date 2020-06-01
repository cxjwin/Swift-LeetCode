//
//  Problem215.swift
//  LeetCode
//
//  Created by smart on 2019/11/9.
//  Copyright © 2019 smart. All rights reserved.
//

struct MinHeap {
    var array: [Int]
    var size: Int
    
    init(_ array: [Int], _ size: Int) {
        self.array = array
        self.size = size
        buildHeap()
    }
    
    mutating func buildHeap() {
        for i in stride(from: size/2 - 1, through: 0, by: -1) {
            heapify(i)
        }
    }
    
    mutating func heapify(_ index: Int) {
        if index >= size/2 {
            return
        }
        
        let left = index * 2 + 1
        let right = left + 1
        
        var minPos = index
        if left < size && array[left] < array[minPos] {
            minPos = left
        }
        if right < size && array[right] < array[minPos] {
            minPos = right
        }
        
        if minPos == index {
            return
        }
        
        array.swapAt(index, minPos)
        heapify(minPos)
    }
    
    func peek() -> Int {
        return array[0]
    }
    
    mutating func replaceTop(_ top: Int) {
        array[0] = top
        heapify(0)
    }
}

public class Problem215: Problem {
    public func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var h = MinHeap(Array(nums[0..<k]), k)
        
        for i in k..<nums.count {
            if h.peek() > nums[i] {
                continue
            }
            
            h.replaceTop(nums[i])
        }
        
        return h.peek()
    }
}
