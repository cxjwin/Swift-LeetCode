//
// Created by smart on 2020/6/10.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

#include <vector>

using namespace std;

class Solution {
public:
    int expand(int left, int right, string s) {
        int l = left, r = right;
        while (l >= 0 && r < s.size() && s[l] == s[r]) {
            --l;
            ++r;
        }
        return r - l - 1;
    }

    string longestPalindrome(string s) {
        int n = s.size();
        if (n < 1) {
            return "";
        }
        int start = 0, end = 0;
        for (int i = 0; i < n; ++i) {
            int len1 = expand(i, i, s);
            int len2 = expand(i, i+1, s);
            int len = max(len1, len2);
            if (len > end - start) {
                start = i - (len - 1) / 2;
                end = i + len / 2;
            }
        }
        return s.substr(start, end - start + 1);
    }

    string longestPalindromeDP(string s) {
        int n = s.length();
        if (n == 0) {
            return s;
        }
        vector<vector<bool>> dp = vector<vector<bool>>(n, vector<bool>(n, false));
        for (int i = 0; i < n; ++i){
            dp[i][i] = true;
        }

        int start = 0;
        int max_len = 1;

        for (int j = 1; j < n; ++j) {
            for (int i = 0; i < j; ++i) {
                if (s[i] != s[j]) {
                    dp[i][j] = false;
                } else {
                    if (j - i < 3) {
                        dp[i][j] = true;
                    } else {
                        dp[i][j] = dp[i+1][j-1];
                    }
                }
                if (dp[i][j] && j - i + 1 > max_len) {
                    start = i;
                    max_len = j - i + 1;
                }
            }
        }

        return s.substr(start, max_len);
    }
};

TEST_CASE("005", "[longestPalindrome]") {

}

TEST_CASE("005-DP", "[longestPalindromeDP]") {

}