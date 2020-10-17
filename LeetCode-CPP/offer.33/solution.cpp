//
// Created by smart on 2020/10/17.
//

#include <vector>

using namespace std;

class Solution {
    bool recur(vector<int>& postorder, int i, int j) {
        if (i >= j) {
            return true;
        }
        auto p = i;
        while (postorder[p] < postorder[j]) {
            ++p;
        }
        auto m = p;
        while (postorder[p] > postorder[j]) {
            ++p;
        }
        if (p == j) {
            return recur(postorder, i, m - 1) && recur(postorder, m, j - 1);
        } else {
            return false;
        }
    }
public:
    bool verifyPostorder(vector<int>& postorder) {
        return recur(postorder, 0, postorder.size() - 1);
    }
};