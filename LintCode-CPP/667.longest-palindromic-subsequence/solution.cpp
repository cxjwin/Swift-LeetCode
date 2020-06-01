//
// Created by smart on 2019/11/7.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>

using namespace std;

class Solution {
public:
    /**
     * @param s: the maximum length of s is 1000
     * @return: the longest palindromic subsequence's length
     */
    int longestPalindromeSubseq(string &s) {
        // write your code here
        string::size_type n = s.size();
        if (n == 0) {
            return 0;
        }
        
        vector<vector<int>> f = vector<vector<int>>();
        for (int i = 0; i < n; ++i) {
            vector<int> t = vector<int>(n, 0);
            f.push_back(t);
        }

        for (string::size_type i = 0; i < n; ++i) {
            f[i][i] = 1;
        }

        for (string::size_type i = 0; i < n-1; ++i) {
            f[i][i+1] = s[i] == s[i+1] ? 2 : 1;
        }

        for (string::size_type len = 3; len <= n; ++len) {
            for (string::size_type i = 0; i <= n-len; ++i) {
                string::size_type j = i + len - 1;
                f[i][j] = max(f[i+1][j], f[i][j-1]);
                if (s[i] == s[j]) {
                    f[i][j] = max(f[i][j], f[i+1][j-1] + 2);
                }
            }
        }

        return f[0][n-1];
    }
};

TEST_CASE("667", "[longestPalindromeSubseq]") {
    Solution s;

    /*
    Input: "bbbab"
    Output: 4
    Explanation:
    One possible longest palindromic subsequence is "bbbb".
     */
    string str = "bbbab";
    REQUIRE(s.longestPalindromeSubseq(str) == 4);

    /*
    Input: "bbbbb"
    Output: 5
     */
    str = "bbbbb";
    REQUIRE(s.longestPalindromeSubseq(str) == 5);
}