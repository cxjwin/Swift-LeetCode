//
// Created by smart on 2020/2/1.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <iostream>
#include <vector>
#include <unordered_map>
#include <unordered_set>
#include <stack>
#include <queue>

using namespace std;

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

/*
class Node {
public:
    int val;
    Node* next;
    Node* random;

    Node(int _val) {
        val = _val;
        next = NULL;
        random = NULL;
    }
};
 */

/*
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};
 */

class Solution {
public:
    int findPos(int a, vector<int> &pos) {
        int b = pos[a];
        if (b == -1) {
            pos[a] = a;
            return a;
        }
        b = findPos(b+1, pos);
        pos[a] = b;
        return b;
    }

    int minIncrementForUnique(vector<int>& A) {
        vector<int> pos(8000, -1);

        int cnt = 0;
        for (auto &&a: A) {
            int b = findPos(a, pos);
            cnt += (b - a);
        }
        return cnt;
    }
};

TEST_CASE("000", "[minIncrementForUnique]") {
    Solution sl;
    // case 1
    {
        vector<int> A = {1, 2, 2};
        auto res = sl.minIncrementForUnique(A);
        REQUIRE(res == 1);
    }
    // case 2
    {
        vector<int> A = {3,2,1,2,1,7};
        auto res = sl.minIncrementForUnique(A);
        REQUIRE(res == 6);
    }
    // case 3
    {
        vector<int> A = {2, 2, 2, 1};
        auto res = sl.minIncrementForUnique(A);
        REQUIRE(res == 3);
    }
}
