//
// Created by smart on 2019/11/16.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <string>
#include <vector>

using namespace std;

class Solution {
public:
    /**
     * @param s1: A string
     * @param s2: A string
     * @param s3: A string
     * @return: Determine whether s3 is formed by interleaving of s1 and s2
     */
    bool isInterleave(string &s1, string &s2, string &s3) {
        // write your code here
        int m = s1.length();
        int n = s2.length();

        if (s3.length() != m + n) {
            return false;
        }

        vector<vector<bool>> f(m+1, vector<bool>(n+1));

        for (int i = 0; i < m+1 ; ++i) {
            for (int j = 0; j < n+1; ++j) {
                if (i == 0 && j == 0) {
                    f[i][j] = true;
                    continue;
                }

                f[i][j] = false;
                if (i > 0 && s3[i+j-1] == s1[i-1]) {
                    f[i][j] = f[i][j] || f[i-1][j];
                }
                if (j > 0 && s3[i+j-1] == s2[j-1]) {
                    f[i][j] = f[i][j] || f[i][j-1];
                }
            }
        }

        return f[m][n];
    }
};

TEST_CASE("029", "[isInterleave]") {
    Solution s;
//    Input:
//    "aabcc"
//    "dbbca"
//    "aadbbcbcac"
//    Output:
//    true
    {
        string s1 = "aabcc";
        string s2 = "dbbca";
        string s3 = "aadbbcbcac";
        REQUIRE(s.isInterleave(s1, s2, s3) == true);
    }

//    Input:
//    ""
//    ""
//    "1"
//    Output:
//    false
    {
        string s1 = "";
        string s2 = "";
        string s3 = "1";
        REQUIRE(s.isInterleave(s1, s2, s3) == false);
    }

//    Input:
//    "aabcc"
//    "dbbca"
//    "aadbbbaccc"
//    Output:
//    false
    {
        string s1 = "aabcc";
        string s2 = "dbbca";
        string s3 = "aadbbbaccc";
        REQUIRE(s.isInterleave(s1, s2, s3) == false);
    }
}
