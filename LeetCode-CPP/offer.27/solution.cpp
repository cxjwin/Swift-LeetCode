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
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};

class Solution {
public:
    TreeNode* mirrorTree(TreeNode* root) {
        if (root == nullptr) {
            return root;
        }
        auto tmp = root->left;
        root->left = root->right;
        root->right = tmp;

        mirrorTree(root->left);
        mirrorTree(root->right);

        return root;
    }
};