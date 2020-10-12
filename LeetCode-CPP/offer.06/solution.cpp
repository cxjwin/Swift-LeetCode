//
// Created by smart on 2020/10/1.
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
    void _reverse(ListNode* head, vector<int> &list) {
        if (head == nullptr) {
            return;
        }
        _reverse(head->next, list);
        list.push_back(head->val);
    }

public:
    vector<int> reversePrint(ListNode* head) {
        auto list = vector<int>{};
        if (head == nullptr) {
            return list;
        }
        _reverse(head, list);
        return list;
    }
};
