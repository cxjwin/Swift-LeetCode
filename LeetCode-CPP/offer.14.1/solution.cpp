//
// Created by smart on 2020/10/5.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

using namespace std;

class Solution {
public:
    int cuttingRope(int n) {
        if (n <= 3) {
            return n - 1;
        }
        int remainder = n % 3;
        if (remainder == 0) {
            return (int)pow(3, n/3);
        } else if (remainder == 1) {
            return (int)pow(3, n/3-1) * 4;
        } else {
            return (int)pow(3, n/3) * 2;
        }
    }

    int cuttingRope2(int n) {
        int res[] = {0, 1, 1, 2, 4, 6, 9}; // [2, 6]
        if (n < 7) {
            return res[n];
        }
        int prev3 = res[4];
        int prev2 = res[5];
        int prev1 = res[6];
        for (int i = 7; i <= n; ++i) {
            int cur = prev3 * 3;
            prev3 = prev2;
            prev2 = prev1;
            prev1 = cur;
        }
        return prev1;
    }
};