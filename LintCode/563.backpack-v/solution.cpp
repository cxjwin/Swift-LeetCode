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
     * @param nums: an integer array and all positive numbers
     * @param target: An integer
     * @return: An integer
     */
    int backPackV(vector<int> &nums, int target) {
        // write your code here
        if (nums.empty()) {
            return 0;
        }

        vector<int>::size_type n = nums.size();

        vector<int> f = vector<int>(target+1, 0);
        f[0] = 1;

        for (int i = 1; i <= n; ++i) {
            for (int j = target; j >= nums[i-1]; --j) {
                f[j] += f[j-nums[i-1]];
            }
        }

        return f[target];
    }
};

TEST_CASE("563", "[backPackV]") {
    Solution s;

    /*
    Given candidate items [1,2,3,3,7] and target 7,
    A solution set is:
    [7]
    [1, 3, 3]
     */
    vector<int> nums = vector<int>{1,2,3,3,7};
    REQUIRE( s.backPackV(nums, 7) == 2 );
}