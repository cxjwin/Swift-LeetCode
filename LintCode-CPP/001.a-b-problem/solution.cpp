//
// Created by smart on 2019/11/4.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

class Solution {
    /**
     * @param a: An integer
     * @param b: An integer
     * @return: The sum of a and b
     */
public:
    int aplusb(int a, int b) {
        return b == 0 ? a : aplusb((a ^ b), (a & b) << 1);
    }
};

TEST_CASE("001", "[aplusb]") {
    Solution s;

    REQUIRE( s.aplusb(1, 2) == 3 );

    REQUIRE( s.aplusb(-100, 1) == -99 );
}
