//
//  Problem19.swift
//  LeetCode
//
//  Created by smart on 2019/11/30.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem19 : Problem {
    
    public func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy: ListNode? = ListNode(0)
        dummy?.next = head
        
        var p = dummy
        
        var i = n
        while i > 0 && p?.next != nil {
            p = p?.next
            i -= 1
        }
        
        if i != 0 {
            return dummy?.next
        }
        
        var q = dummy
        
        while p?.next != nil {
            p = p?.next
            q = q?.next
        }
        
        q?.next = q?.next?.next
        
        return dummy?.next
    }
    
}
