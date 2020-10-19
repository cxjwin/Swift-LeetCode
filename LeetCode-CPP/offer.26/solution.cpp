//
// Created by smart on 2020/10/15.
//

/**
 * Definition for a binary tree node.
 */
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution {
    bool _recur(TreeNode* A, TreeNode* B) {
        if (B == nullptr) {
            return true;
        }
        if (A == nullptr || A->val != B->val) {
            return false;
        }
        return _recur(A->left, B->left) && _recur(A->right, B->right);
    }
public:
    bool isSubStructure(TreeNode* A, TreeNode* B) {
        return (A != nullptr && B != nullptr) && _recur(A, B) ||
               (A != nullptr && isSubStructure(A->left, B)) ||
               (A != nullptr && isSubStructure(A->right, B));
    }
};