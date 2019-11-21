//
// Created by smart on 2019/11/20.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>

using namespace std;

class Solution {
public:
    /**
     * @param s1: A string
     * @param s2: Another string
     * @return: whether s2 is a scrambled string of s1
     */
    bool isScramble(string &s1, string &s2) {
        // write your code here
        if (s1.size() != s2.size()) {
            return false;
        }

        if (s1 == s2) {
            return true;
        }

        int n = s1.size();
        vector<vector<vector<int>>> f(n, vector<vector<int>>(n, vector<int>(n+1, 0)));

        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < n; ++j) {
                f[i][j][1] = (s1[i] == s2[j]);
            }
        }

        for (int len = 2; len <= n; ++len) {
            for (int i = 0; i <= n-len; ++i) {
                for (int j = 0; j <= n-len; ++j) {
                    for (int k = 1; k < len; ++k) {
                        if (f[i][j][k] && f[i+k][j+k][len-k]) {
                            f[i][j][len] = true;
                            continue;
                        }
                        if (f[i+k][j][len-k] && f[i][j+len-k][k]) {
                            f[i][j][len] = true;
                        }
                    }
                }
            }
        }

        return f[0][0][n];
    }
};

TEST_CASE("087", "[isScramble]") {
    Solution s;

//    Input: s1 = "great", s2 = "rgeat"
//    Output: true
//    Explanation: As described above.
    {
        string s1 = "great";
        string s2 = "rgeat";
        REQUIRE(s.isScramble(s1, s2) == true);
    }

//    Input: s1 = "a", s2 = "b"
//    Output: false
    {
        string s1 = "a";
        string s2 = "b";
        REQUIRE(s.isScramble(s1, s2) == false);
    }
}
