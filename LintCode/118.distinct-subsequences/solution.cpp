//
// Created by smart on 2019/11/23.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <string>

using namespace std;

class Solution {
public:
    /**
     * @param S: A string
     * @param T: A string
     * @return: Count the number of distinct subsequences
     */
    int numDistinct(string &S, string &T) {
        // write your code here
        int m = S.size();
        int n = T.size();

        vector<vector<int>> f(m+1, vector<int>(n+1, 0));
        for (int i = 0; i <= m; ++i) {
            f[i][0] = 1;
        }

        for (int i = 1; i <= m; ++i) {
            for (int j = 1; j <= n; ++j) {
                f[i][j] = f[i-1][j];
                if (S[i-1] == T[j-1]) {
                    f[i][j] += f[i-1][j-1];
                }
            }
        }

        return f[m][n];
    }
};

TEST_CASE("118", "[numDistinct]") {
    Solution s;

//    Input: S = "rabbbit", T = "rabbit"
//    Output: 3
//    Explanation: You could remove any 'b' in S, so there are 3 ways to get T.
    {
        string S = "rabbbit";
        string T = "rabbit";
        REQUIRE(s.numDistinct(S, T) == 3);
    }

//    Input: S = "abcd", T = ""
//    Output: 1
//    Explanation: There is only 1 way to get T - remove all chars in S.
    {
        string S = "abcd";
        string T = "";
        REQUIRE(s.numDistinct(S, T) == 1);
    }
}

