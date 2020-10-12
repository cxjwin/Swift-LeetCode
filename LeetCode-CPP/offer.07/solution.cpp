//
// Created by smart on 2020/10/2.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <unordered_map>

using namespace std;

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
    TreeNode* _buildTree(vector<int>& preorder,
                         int preorderStart,
                         int preorderEnd,
                         vector<int>& inorder,
                         int inorderStart,
                         int inorderEnd,
                         unordered_map<int, int> &indexMap) {
        if (preorderStart > preorderEnd) {
            return nullptr;
        }
        int rootVal = preorder[preorderStart];
        TreeNode *rootNode = new TreeNode(rootVal);
        if (preorderStart == preorderEnd) {
            return rootNode;
        }
        int rootIndex = indexMap[rootVal];
        int leftNodes = rootIndex - inorderStart;
        int rightNodes = inorderEnd - rootIndex;
        rootNode->left = _buildTree(preorder,
                                    preorderStart + 1,
                                    preorderStart + leftNodes,
                                    inorder,
                                    inorderStart,
                                    rootIndex - 1,
                                    indexMap);
        rootNode->right = _buildTree(preorder,
                                     preorderEnd - rightNodes + 1,
                                     preorderEnd,
                                     inorder,
                                     rootIndex + 1,
                                     inorderEnd,
                                     indexMap);
        return rootNode;
    }
public:
    TreeNode* buildTree(vector<int>& preorder, vector<int>& inorder) {
        if (preorder.size() == 0) {
            return nullptr;
        }
        auto len = inorder.size();
        unordered_map<int, int> indexMap;
        for (int i = 0; i < len; ++i) {
            indexMap[inorder[i]] = i;
        }
        return _buildTree(preorder,
                          0,
                          len - 1,
                          inorder,
                          0,
                          len - 1,
                          indexMap);
    }
};


