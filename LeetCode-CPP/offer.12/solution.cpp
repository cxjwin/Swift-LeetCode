//
// Created by smart on 2020/10/2.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>
#include <string>
#include <unordered_set>

using namespace std;

class Solution {
    bool dfs(vector<vector<char>> &board,
             int i,
             int j,
             string &word,
             int k) {
        if ((i < 0 || i >= board.size()) || (j < 0 || j >= board[0].size())) {
            return false;
        }
        if (board[i][j] != word[k]) {
            return false;
        }
        if (k == word.length() - 1) {
            return true;
        }
        char tmp = board[i][j];
        board[i][j] = '/n';
        bool res =
                dfs(board, i+1, j, word, k+1) ||
                dfs(board, i-1, j, word, k+1) ||
                dfs(board, i, j+1, word, k+1) ||
                dfs(board, i, j-1, word, k+1);
        board[i][j] = tmp;
        return res;
    }
public:
    bool exist(vector<vector<char>>& board, string word) {
        if (board.size() == 0 || board[0].size() == 0 || word.length() == 0) {
            return false;
        }
        int m = board.size(), n = board[0].size();
        for (int i = 0; i < m; ++i) {
            for (int j = 0; j < n; ++j) {
                if (dfs(board, i, j, word, 0)) {
                    return true;
                }
            }
        }
        return false;
    }
};