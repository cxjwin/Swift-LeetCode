#include <numeric>
#include <queue>
#include <string>
#include <vector>

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

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

class Codec {
  TreeNode *dummy = new TreeNode(-1);

 public:
  // Encodes a tree to a single string.
  string serialize(TreeNode *root) {
    if (root == nullptr) {
      return string("[]");
    }

    vector<string> res;
    queue<TreeNode *> q;
    q.push(root);

    while (!q.empty()) {
      auto node = q.front();
      q.pop();
      if (node != dummy) {
        res.push_back(to_string(node->val));
        if (node->left != nullptr) {
          q.push(node->left);
        } else {
          q.push(dummy); 
        }
        if (node->right != nullptr) {
          q.push(node->right);
        } else {
          q.push(dummy); 
        }
      } else {
        res.push_back("null");
      }
    }
    
    // 去除多余的 "null"
    while (res.back() == "null") {
      res.pop_back();
    }
    
    string arr_str{"["};
    arr_str += res[0];
    for (size_t i = 1; i < res.size(); i++) {
      arr_str += ",";
      arr_str += res[i];
    }
    return arr_str + "]";
  }

  // Decodes your encoded data to tree.
  TreeNode *deserialize(string data) { 
    if (data == "[]") {
      return nullptr;
    }
    
    vector<string> arr;
    auto arr_str = data.substr(1, data.size() - 2);
    size_t pos = 0;
    while ((pos = arr_str.find(",")) != string::npos) {
      auto str = arr_str.substr(0, pos);
      arr.push_back(str);
      arr_str.erase(0, pos + 1);
    }
    arr.push_back(arr_str); // add last

    auto root = new TreeNode(stoi(arr[0]));
    queue<TreeNode *> q;
    q.push(root);

    int i = 1;
    while (!q.empty()) {
      auto node = q.front();
      q.pop();
      if (i < arr.size() && arr[i] != "null") {
        node->left = new TreeNode(stoi(arr[i]));
        q.push(node->left);
      }
      ++i;
      if (i < arr.size() && arr[i] != "null") {
        node->right = new TreeNode(stoi(arr[i]));
        q.push(node->right);
      }
      ++i;
    }
    return root; 
  }
};

TEST_CASE( "offer_37", "[Codec]" ) {
    Codec sl = Codec();

    auto node = sl.deserialize("[1,2,3,null,null,4,5]");
    auto str = sl.serialize(node);

    REQUIRE ( str == "[1,2,3,null,null,4,5]" );
}