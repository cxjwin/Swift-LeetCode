//
// Created by smart on 2019/11/23.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <string>
#include <vector>

using namespace std;

class Solution {
public:
    /**
     * @param s: A string
     * @param p: A string includes "." and "*"
     * @return: A boolean
     */
    bool isMatch(string &s, string &p) {
        // write your code here
        int m = s.size();
        int n = p.size();

        vector<vector<bool>> f(m+1, vector<bool>(n+1, false));

        for (int i = 0; i <= m; ++i) {
            for (int j = 0; j <= n; ++j) {
                if (i == 0 && j == 0) {
                    f[i][j] = true;
                    continue;
                }
                if (j == 0) {
                    f[i][j] = false;
                    continue;
                }

                f[i][j] = false;
                if (p[j-1] != '*') {
                    if (i >= 1 && (s[i-1] == p[j-1] || p[j-1] == '.')) {
                        f[i][j] = f[i-1][j-1];
                    }
                } else {
                    if (j >= 2) {
                        f[i][j] = (f[i][j] || f[i][j-2]);
                    }
                    if (j >= 2 && i >= 1 && (p[j-2] == '.' || p[j-2] == s[i-1])) {
                        f[i][j] = (f[i][j] || f[i-1][j]);
                    }
                }
            }
        }

        return f[m][n];
    }
};

TEST_CASE("154", "[isMatch]") {
    Solution st;

    {
        string s = "aa";
        string p = "..*";
        REQUIRE(st.isMatch(s, p) == true);
    }

//    isMatch("aa","a") → false
    {
        string s = "aa";
        string p = "a";
        REQUIRE(st.isMatch(s, p) == false);
    }

//    isMatch("aa","aa") → true
    {
        string s = "aa";
        string p = "aa";
        REQUIRE(st.isMatch(s, p) == true);
    }

//    isMatch("aaa","aa") → false
    {
        string s = "aaa";
        string p = "aa";
        REQUIRE(st.isMatch(s, p) == false);
    }

//    isMatch("aa", "a*") → true
    {
        string s = "aa";
        string p = "a*";
        REQUIRE(st.isMatch(s, p) == true);
    }

//    isMatch("aa", ".*") → true
    {
        string s = "aa";
        string p = ".*";
        REQUIRE(st.isMatch(s, p) == true);
    }

//    isMatch("ab", ".*") → true
    {
        string s = "ab";
        string p = ".*";
        REQUIRE(st.isMatch(s, p) == true);
    }

//    isMatch("aab", "c*a*b") → true
    {
        string s = "aab";
        string p = "c*a*b*";
        REQUIRE(st.isMatch(s, p) == true);
    }
}