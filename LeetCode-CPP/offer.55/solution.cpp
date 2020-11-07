#include <algorithm>
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

class Solution {
  int dfs(TreeNode *root) {
    if (root == nullptr) {
      return 0;
    }
    return max(dfs(root->left), dfs(root->right)) + 1;
  }
 public:
  int maxDepth(TreeNode *root) {
    return dfs(root);
  }
};

class Solution2 {
 public:
  int maxDepth(TreeNode *root) {
    if (root == nullptr) {
      return 0;
    }
    queue<TreeNode *> q;
    q.push(root);
    int l = 0;
    while (!q.empty()) {
      int size = q.size();
      ++l;
      for (int i = 0; i < size; ++i) {
        auto node = q.front();
        q.pop();
        if (node->left != nullptr) {
          q.push(node->left);
        }
        if (node->right != nullptr) {
          q.push(node->right);
        }
      }
    }
    return l;
  }
};

class SolutionII {
  int depth(TreeNode *root) {
    if (root == nullptr) {
      return 0;
    }
    return max(depth(root->left), depth(root->right)) + 1;
  }
 public:
  bool isBalanced(TreeNode *root) {
    if (root == nullptr) {
      return true;
    }
    return abs(depth(root->left) - depth(root->right)) < 2 && 
      isBalanced(root->left) && 
      isBalanced(root->right);
  }
};

class SolutionII2 {
  int recurr(TreeNode* root) {
    if (root == nullptr) {
      return 0;
    }
    int left = recurr(root->left);
    if (left == -1) return -1;
    int right = recurr(root->right);
    if (right == -1) return -1;
    return abs(left - right) < 2 ? max(left, right) + 1 : -1;
  }
  public:
    bool isBalanced(TreeNode* root) {
      return recurr(root) != -1;
    }
};