//
// Created by smart on 2020/10/17.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>
#include <queue>

using namespace std;

/**
 * Definition for a binary tree node.
 */
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};

// bfs
class SolutionI {
public:
    vector<int> levelOrder(TreeNode* root) {
        vector<int> res;
        if (root == nullptr) {
            return res;
        }
        queue<TreeNode *> q;
        q.push(root);
        while (!q.empty()) {
            auto node = q.front();
            q.pop();
            res.push_back(node->val);
            if (node->left) {
                q.push(node->left);
            }
            if (node->right) {
                q.push(node->right);
            }
        }
        return res;
    }
};

// bfs
class SolutionII {
public:
    vector<vector<int>> levelOrder(TreeNode* root) {
        vector<vector<int>> res;
        if (root == nullptr) {
            return res;
        }

        queue<TreeNode *> q;
        q.push(root);
        while (!q.empty()) {
            auto size = q.size();
            vector<int> level_res;
            for (int i = 0; i < size; ++i) {
                auto node = q.front();
                q.pop();
                level_res.push_back(node->val);
                if (node->left != nullptr) {
                    q.push(node->left);
                }
                if (node->right != nullptr) {
                    q.push(node->right);
                }
            }
            res.push_back(level_res);
        }

        return res;
    }
};

// dfs
class SolutionII2 {
    void _order(TreeNode *root, int level, vector<vector<int>> &res) {
        if (root == nullptr) {
            return;
        }
        if (level == res.size()) {
            res.push_back(vector<int>{});
        }
        auto level_res = res[level];
        level_res.push_back(root->val);
        res[level] = level_res;
        _order(root->left, level + 1, res);
        _order(root->right, level + 1, res);
    }
public:
    vector<vector<int>> levelOrder(TreeNode* root) {
        vector<vector<int>> res;
        if (root == nullptr) {
            return res;
        }
        _order(root, 0, res);
        return res;
    }
};

class SolutionIII {
public:
    vector<vector<int>> levelOrder(TreeNode* root) {
        vector<vector<int>> res;
        if (root == nullptr) {
            return res;
        }
        queue<TreeNode *> q;
        q.push(root);
        int level = 0;
        while (!q.empty()) {
            auto size = q.size();
            vector<int> level_res;
            for (int i = 0; i < size; ++i) {
                auto node = q.front();
                q.pop();
                if (level & 1 == 1) {
                    level_res.insert(level_res.begin(), node->val);
                } else {
                    level_res.push_back(node->val);
                }
                if (node->left != nullptr) {
                    q.push(node->left);
                }
                if (node->right != nullptr) {
                    q.push(node->right);
                }
            }
            res.push_back(level_res);
            ++level;
        }
        return res;
    }
};

class SolutionIII2 {
    void _order(TreeNode *root, int level, vector<vector<int>> &res) {
        if (root == nullptr) {
            return;
        }
        if (level == res.size()) {
            res.push_back(vector<int>{});
        }
        auto level_res = res[level];
        if (level & 1 == 1) {
            level_res.insert(level_res.begin(), root->val);
        } else {
            level_res.push_back(root->val);
        }
        res[level] = level_res;
        _order(root->left, level + 1, res);
        _order(root->right, level + 1, res);
    }
public:
    vector<vector<int>> levelOrder(TreeNode* root) {
        vector<vector<int>> res;
        if (root == nullptr) {
            return res;
        }
        _order(root, 0, res);
        return res;
    }
};