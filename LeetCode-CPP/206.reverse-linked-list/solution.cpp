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
    ListNode* reverseList(ListNode* head) {
        if (head == nullptr || head->next == nullptr) {
            return head;
        }
        ListNode *root = reverseList(head->next);
        head->next->next = head;
        head->next = nullptr;
        return root;
    }

    ListNode* reverseList2(ListNode* head) {
        ListNode *pre = nullptr;
        ListNode *cur = head;
        while (cur != nullptr) {
            auto next = cur->next;
            cur->next = pre;
            pre = cur;
            cur = next;
        }
        return pre;
    }
};
