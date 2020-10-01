//
// Created by smart on 2020/6/21.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

#include <vector>

using namespace std;

class Solution {
public:
    int longestCommonSubsequence(string text1, string text2) {
        if (text1.size() == 0 || text2.size() == 0) {
            return 0;
        }
        int m = text1.size(), n = text2.size();
        vector<vector<int>> dp = vector<vector<int>>(m + 1, vector<int>(n + 1, 0));
        for (int i = 1; i <= m; ++i) {
            for (int j = 1; j <= n; ++j) {
                if (text1[i-1] == text2[j-1]) {
                    dp[i][j] = dp[i-1][j-1] + 1;
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1]);
                }
            }
        }
        return dp[m][n];
    }
};

TEST_CASE("1143", "[longestCommonSubsequence]") {
    Solution sl;
    auto text1 = "abcde";
    auto text2 = "ace";
    REQUIRE( sl.longestCommonSubsequence(text1, text2) == 3 );
}