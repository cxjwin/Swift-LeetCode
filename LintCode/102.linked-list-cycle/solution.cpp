//
// Created by smart on 2019/11/29.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

/**
 * Definition of singly-linked-list:
 * class ListNode {
 * public:
 *     int val;
 *     ListNode *next;
 *     ListNode(int val) {
 *        this->val = val;
 *        this->next = NULL;
 *     }
 * }
 */

class ListNode {
public:
    int val;
    ListNode *next;
    ListNode(int val) {
        this->val = val;
        this->next = NULL;
    }
};

class Solution {
public:
    /**
     * @param head: The first node of linked list.
     * @return: True if it has a cycle, or false
     */
    bool hasCycle(ListNode * head) {
        // write your code here
        if (head == NULL || head->next == NULL) {
            return false;
        }

        ListNode *slow = head->next;
        ListNode *fast = head->next->next;

        while (fast != NULL && fast->next != NULL) {
            if (slow == fast) {
                return true;
            }
            slow = slow->next;
            fast = fast->next->next;
        }

        return false;
    }
};

TEST_CASE("102", "[hasCycle]") {
    Solution s;
//    Example 1:
//    Input: 21->10->4->5,  then tail connects to node index 1(value 10).
//    Output: true
    ListNode *head = new ListNode(21);
    head->next = new ListNode(10);
    head->next->next = new ListNode(4);
    head->next->next->next = new ListNode(5);
    head->next->next->next->next = head->next;

    REQUIRE(s.hasCycle(head) == true);
}