//
// Created by smart on 2019/11/21.
//

#define CATCH_CONFIG_MAIN

#include "../catch.hpp"
#include <vector>

using namespace std;

class Solution {
public:
    /**
     * @param word1: A string
     * @param word2: A string
     * @return: The minimum number of steps.
     */
    int minDistance(string &word1, string &word2) {
        // write your code here
        int m = word1.size();
        int n = word2.size();
        if (m == 0) {
            return n;
        }
        if (n == 0) {
            return m;
        }

        int f[m+1][n+1];
        f[0][0] = 0;
        for (int i = 1; i <= m; ++i) {
            f[i][0] = i;
        }
        for (int j = 1; j <= n; ++j) {
            f[0][j] = j;
        }

        for (int i = 1; i <= m; ++i) {
            for (int j = 1; j <= n; ++j) {
                if (word1[i-1] == word2[j-1]) {
                    f[i][j] = f[i-1][j-1];
                } else {
                    f[i][j] = min(f[i-1][j] + 1, f[i][j-1] + 1);
                    f[i][j] = min(f[i][j], f[i-1][j-1] + 1);
                }
            }
        }
        
        return f[m][n];
    }
};

TEST_CASE("119", "[minDistance]") {
    Solution s;

//    Input:
//    "horse"
//    "ros"
//    Output: 3
//    Explanation:
//    horse -> rorse (replace 'h' with 'r')
//    rorse -> rose (remove 'r')
//    rose -> ros (remove 'e')
    {
        string word1 = "horse";
        string word2 = "ros";
        REQUIRE(s.minDistance(word1, word2) == 3);
    }
}