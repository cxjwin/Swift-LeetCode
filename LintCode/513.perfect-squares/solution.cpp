//
// Created by smart on 2019/11/6.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>

using namespace std;

class Solution {
public:
    /**
     * @param n: a positive integer
     * @return: An integer
     */
    int numSquares(int n) {
        // write your code here
        vector<int> f = vector<int>(n+1, INT_MAX);
        f[0] = 0;

        for (int i = 1; i <= n; ++i) {
            for (int j = 1; j*j <= i; ++j) {
                f[i] = min(f[i], f[i-j*j] + 1);
            }
        }

        return f[n];
    }
};

TEST_CASE("513", "[numSquares]") {
    Solution s;

    /*
    Input: 12
    Output: 3
    Explanation: 4 + 4 + 4
     */
    REQUIRE( s.numSquares(12) == 3 );

    /*
    Input: 13
    Output: 2
    Explanation: 4 + 9
     */
    REQUIRE( s.numSquares(13) == 2 );
}