//
//  Problem876.swift
//  LeetCode
//
//  Created by smart on 2019/11/30.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem876 : Problem {
    public func middleNode(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
}
