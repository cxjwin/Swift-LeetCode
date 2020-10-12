//
// Created by smart on 2020/10/2.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

using namespace std;

class Solution {
public:
    int fib(int n) {
        if (n < 2) {
            return n;
        }
        int step1 = 0;
        int step2 = 1;
        for (int i = 2; i <= n; ++i) {
            int step3 = step1 + step2;
            step1 = step2;
            step2 = step3;
        }
        return step2;
    }
};