//
//  Problem21.swift
//  LeetCode
//
//  Created by smart on 2019/11/30.
//  Copyright © 2019 smart. All rights reserved.
//

public class Problem21 : Problem {
    public func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        let dummy: ListNode? = ListNode(0)
        
        var p = l1
        var q = l2
        var r = dummy
        while p != nil && q != nil {
            if (p!.val < q!.val) {
                r?.next = p
                r = r?.next
                p = p?.next
            } else {
                r?.next = q
                r = r?.next
                q = q?.next
            }
        }
        
        while p != nil {
            r?.next = p
            r = r?.next
            p = p?.next
        }
        while q != nil {
            r?.next = q
            r = r?.next
            q = q?.next
        }
        
        return dummy?.next
    }
}
