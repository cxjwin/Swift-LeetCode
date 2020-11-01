
#include <vector>

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
  void dfs(TreeNode *root, vector<int> &arr) {
    if (root == nullptr) {
      return;
    }
    dfs(root->right, arr);
    arr.push_back(root->val);
    dfs(root->left, arr);
  }

 public:
  int kthLargest(TreeNode *root, int k) {
    vector<int> arr;
    dfs(root, arr);
    return arr[k - 1];
  }
};

class Solution2 {
  int k = 0;
  int res = 0;
  void dfs(TreeNode *root) {
    if (root == nullptr) {
      return;
    }
    dfs(root->right);
    if (k == 0) {
      return;
    }
    if (--k == 0) {
      res = root->val;
      return;
    }
    dfs(root->left);
  }

 public:
  int kthLargest(TreeNode *root, int kk) {
    k = kk;
    dfs(root);
    return res;
  }
};
