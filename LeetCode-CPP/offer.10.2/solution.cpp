//
// Created by smart on 2020/10/2.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

using namespace std;

class Solution {
public:
    int numWays(int n) {
        if (n < 3) {
            return n == 0 ? 1 : n;
        }
        int step1 = 1;
        int step2 = 2;
        for (int i = 3; i < n + 1; ++i) {
            int step3 =  (step1 + step2) % 1000000007;
            step1 = step2;
            step2 = step3;
        }
        return step2;
    }
};