//
// Created by smart on 2020/10/16.
//

#include <vector>

using namespace std;

class Solution {
public:
    vector<int> spiralOrder(vector<vector<int>>& matrix) {
        int m = matrix.size();
        if (m == 0) {
            return vector<int>{};
        }
        int n = matrix[0].size();
        if (n == 0) {
            return vector<int>{};
        }
        int t = 0, b = m - 1;
        int l = 0, r = n - 1;
        vector<int> res;
        while (true) {
            for (int i = l; i <= r; ++i) {
                res.push_back(matrix[t][i]);
            }
            if (++t > b) {
                break;
            }
            for (int i = t; i <= b; ++i) {
                res.push_back(matrix[i][r]);
            }
            if (--r < l) {
                break;
            }
            for (int i = r; i >= l; --i) {
                res.push_back(matrix[b][i]);
            }
            if (--b < t) {
                break;
            }
            for (int i = b; i >= t; --i) {
                res.push_back(matrix[i][l]);
            }
            if (++l > r) {
                break;
            }
        }
        return res;
    }
};