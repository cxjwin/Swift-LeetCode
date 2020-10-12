//
// Created by smart on 2020/10/6.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

using namespace std;

class Solution {
public:
    int hammingWeight(uint32_t n) {
        int res = 0;
        while (n != 0) {
            if (n & 1 == 1) {
                ++res;
            }
            n >>= 1;
        }
        return res;
    }

    int hammingWeight2(uint32_t n) {
        int res = 0;
        while (n != 0) {
            ++res;
            n &= (n-1);
        }
        return res;
    }
};