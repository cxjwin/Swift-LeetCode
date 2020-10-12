//
// Created by smart on 2020/10/13.
//

#include <string>
#include <vector>

using namespace std;

class Solution {
public:
    bool isMatch(string s, string p) {
        int m = s.length(), n = p.length();
        auto dp = vector<vector<bool>>(m+1, vector<bool>(n+1, false));
        for (int i = 0; i <= m; ++i) {
            for (int j = 0; j <= n; ++j) {
                if (j == 0) {
                    dp[i][j] = i == 0;
                    continue;
                }
                dp[i][j] = false;
                if (i >= 1 && (s[i-1] == p[j-1] || p[j-1] == '.')) {
                    dp[i][j] = dp[i-1][j-1];
                }
                if (p[j-1] == '*') {
                    if (j >= 2 && i >= 1 && (p[j-2] == s[i-1] || p[j-2] == '.')) {
                        dp[i][j] = dp[i - 1][j];
                    }
                    if (j >= 2) {
                        dp[i][j] = dp[i][j] ?: dp[i][j-2];
                    }
                }
            }
        }
        return dp[m][n];
    }
};