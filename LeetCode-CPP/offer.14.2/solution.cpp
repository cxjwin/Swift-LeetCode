//
// Created by smart on 2020/10/6.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

using namespace std;

class Solution {
public:
    int cuttingRope(int n) {
        int res[] = {0, 1, 1, 2, 4, 6, 9};
        if (n < 7) {
            return res[n];
        }
        int prev3 = res[4];
        int prev2 = res[5];
        int prev1 = res[6];
        for (int i = 7; i <= n; ++i) {
            int cur = prev3 * 3 % 1000000007;
            prev3 = prev2;
            prev2 = prev1;
            prev1 = cur;
        }
        return prev1;
    }
};