//
// Created by smart on 2020/10/6.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

using namespace std;

class Solution {
public:
    // 超时
    double myPow(double x, int n) {
        int abs_n = n < 0 ? -n : n;
        double res = 1.0;
        while (abs_n != 0) {
            res *= x;
            --abs_n;
        }
        return n < 0 ? 1.0 / res : res;
    }

    double myPow2(double x, int n) {
        long abs_n = n < 0 ? (long)n * -1 : n;
        x = n < 0 ? 1 / x : x;
        double res = 1.0;
        while (abs_n != 0) {
            if (abs_n & 1) {
                res *= x;
            }
            x *= x;
            abs_n >>= 1;
        }
        return res;
    }
};