//
// Created by smart on 2020/10/6.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>
#include <string>

using namespace std;

class Solution {
    vector<int> res;

    void dfs(int n, int idx, string str) {
        if (idx >= n) {
            int num = stoi(str);
            if (num != 0) {
                res.push_back(num);
            }
            return;
        }
        for (int i = 0; i <= 9; ++i) {
            dfs(n, idx + 1, str + to_string(i));
        }
    }
public:
    vector<int> printNumbers(int n) {
        dfs(n, 0, "");
        return res;
    }
};

class Solution2 {
public:
    vector<int> printNumbers(int n) {
        vector<int> res;
        int num = 1;
        for (int i = 0; i < n; ++i) {
            num *= 10;
        }
        for (int i = 1; i < num; ++i) {
            res.push_back(i);
        }
        return res;
    }
};