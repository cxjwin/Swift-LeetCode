//
//  Problem42.swift
//  LeetCode
//
//  Created by smart on 2019/12/2.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem42 : Problem {
    /// My frist solution (Time Limit Exceeded)
    public func trap(_ height: [Int]) -> Int {
        var set = [Int]()
        let sorted = height.sorted()
        for h in sorted {
            if set.count == 0 {
                set.append(h)
            } else {
                if h > set.last! {
                    set.append(h)
                }
            }
        }
        
        if set.count <= 1 {
            return 0
        }
        
        let cnt = set.count
        
        var sum = 0
        for idx in (1..<cnt).reversed() {
            let d = (set[idx] - set[idx-1])
            
            var fir = -1
            var sec = -1
            
            for (i, h) in height.enumerated() {
                if h >= set[idx] {
                    if fir == -1 {
                        fir = i
                        continue
                    }
                    if sec == -1 {
                        sec = i
                    }
                    
                    if fir != -1 && sec != -1 {
                        sum += ((sec - fir - 1) * d)                        
                        fir = sec
                        sec = -1
                    }
                }
            }
        }
        
        return sum
    }
    
    public func trap2(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxLeft = 0
        var maxRight = 0
        
        var sum = 0
        
        while left <= right {
            if height[left] <= height[right] {
                if height[left] >= maxLeft {
                    maxLeft = height[left]
                } else {
                    sum += (maxLeft - height[left])
                }
                left += 1
            } else {
                if height[right] >= maxRight {
                    maxRight = height[right]
                } else {
                    sum += (maxRight - height[right])
                }
                right -= 1
            }
        }
        
        return sum
    }
}
