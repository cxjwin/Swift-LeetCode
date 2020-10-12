//
// Created by smart on 2020/10/5.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

/**
 * Definition for singly-linked list.
 */
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
public:
    ListNode* mergeTwoLists(ListNode* l1, ListNode* l2) {
        if (l1 == nullptr) {
            return l2;
        } else if (l2 == nullptr) {
            return l1;
        }
        auto dummy = ListNode(-1);
        auto p = l1;
        auto q = l2;
        auto r = &dummy;
        while (p != nullptr && q != nullptr) {
            if (p->val < q->val) {
                r->next = p;
                p = p->next;
            } else {
                r->next = q;
                q = q->next;
            }
            r = r->next;
        }
        r->next = p != nullptr ? p : q;
        return dummy.next;
    }

    ListNode* mergeTwoLists2(ListNode* l1, ListNode* l2) {
        if (l1 == nullptr) {
            return l2;
        } else if (l2 == nullptr) {
            return l1;
        } else if (l1->val < l2->val) {
            l1->next = mergeTwoLists2(l1->next, l2);
            return l1;
        } else {
            l2->next = mergeTwoLists2(l1, l2->next);
            return l2;
        }
    }
};
