//
//  Problem206.swift
//  LeetCode
//
//  Created by smart on 2019/11/28.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem206 : Problem {
    public func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let node = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        
        return node
    }
    
    public func reverseList2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var pre: ListNode? = nil
        var cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        
        return pre
    }
}
