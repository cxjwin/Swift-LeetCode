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
     * @param A: A string
     * @param B: A string
     * @return: The length of longest common subsequence of A and B
     */
    int longestCommonSubsequence(string &A, string &B) {
        // write your code here
        int m = A.length();
        int n = B.length();

        vector<vector<int>> f(m+1, vector<int>(n+1, 0));

        for (int i = 0; i < m+1; ++i) {
            for (int j = 0; j < n+1 ; ++j) {
                if (i == 0 || j == 0) {
                    f[i][j] = 0;
                    continue;
                }

                f[i][j] = max(f[i-1][j], f[i][j-1]);
                if (A[i-1] == B[j-1]) {
                    f[i][j] = max(f[i][j], f[i-1][j-1] + 1);
                }
            }
        }

        return f[m][n];
    }
};

TEST_CASE("077", "[longestCommonSubsequence]") {
    Solution s;
//    Input:  "ABCD" and "EDCA"
//    Output:  1
    string A = "ABCD";
    string B = "EDCA";
    REQUIRE(s.longestCommonSubsequence(A, B) == 1);

//    Input: "ABCD" and "EACB"
//    Output:  2
    A = "ABCD";
    B = "EACB";
    REQUIRE(s.longestCommonSubsequence(A, B) == 2);

//    Input
//    "jiuzhang"
//    "lijiang"
//    Expected
//    5
    A = "jiuzhang";
    B = "lijiang";
    REQUIRE(s.longestCommonSubsequence(A, B) == 5);
}