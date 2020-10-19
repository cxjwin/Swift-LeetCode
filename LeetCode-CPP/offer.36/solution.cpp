

/*
// Definition for a Node.
*/
class Node {
public:
    int val;
    Node* left;
    Node* right;

    Node() {}

    Node(int _val) {
        val = _val;
        left = nullptr;
        right = nullptr;
    }

    Node(int _val, Node* _left, Node* _right) {
        val = _val;
        left = _left;
        right = _right;
    }
};

class Solution {
  Node *pre = nullptr;
  Node* head = nullptr;

  void dfs(Node* root) {
    if (root == nullptr) {
      return;
    }
    dfs(root->left);
    if (pre != nullptr) {
      pre->right = root;
      root->left = pre;
    } else {
      head = root;
    }
    pre = root;
    dfs(root->right);
  }
public:
    Node* treeToDoublyList(Node* root) {
      if (root == nullptr) {
        return nullptr;
      }
      dfs(root);
      pre->right = head;
      head->left = pre;
      return head;
    }
};