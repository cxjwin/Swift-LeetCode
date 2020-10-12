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
    ListNode* removeNthFromEnd(ListNode* head, int n) {
        auto fast = head;
        int i = 1;
        for (; i <= n; ++i) {
            fast = fast->next;
        }
        auto dummy = ListNode(-1);
        dummy.next = head;
        auto slow = &dummy;
        while (fast != nullptr) {
            slow = slow->next;
            fast = fast->next;
        }
        auto next = slow->next;
        slow->next = slow->next->next;
        delete next;
        return dummy.next;
    }
};
