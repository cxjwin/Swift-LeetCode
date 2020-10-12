//
// Created by smart on 2020/10/10.
//

#define CATCH_CONFIG_MAIN

#include "../catch.hpp"
#include <vector>

using namespace std;

/**
 * Definition for singly-linked list.
 */
struct ListNode {
    int val;
    ListNode *next;

    ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
    void remove_if(ListNode **head, int val) {
        for (ListNode **curr = head; *curr;) {
            ListNode *entry = *curr;
            if (entry->val == val) {
                *curr = entry->next;
                // delete entry;
            } else {
                curr = &entry->next;
            }
        }
    }
public:
    ListNode *deleteNode(ListNode *head, int val) {
        remove_if(&head, val);
        return head;
    }
};