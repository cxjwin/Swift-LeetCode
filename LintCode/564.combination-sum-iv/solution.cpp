//
// Created by smart on 2019/11/7.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>

using namespace std;

class Solution {
public:
    /**
     * @param nums: an integer array and all positive numbers, no duplicates
     * @param target: An integer
     * @return: An integer
     */
    int backPackVI(vector<int> &nums, int target) {
        // write your code here
        if (nums.empty()) {
            return 0;
        }

        vector<int>::size_type n = nums.size();

        vector<int> f = vector<int>(target+1, 0);
        f[0] = 1;

        for (int i = 1; i <= target; ++i) {
            for (int j = 0; j < n; ++j) {
                int num = nums[j];
                if (num <= i) {
                    f[i] += f[i-num];
                }
            }
        }

        return f[target];
    }
};

TEST_CASE("564", "[backPackVI]") {
    Solution s;

    /*
    Input: nums = [1, 2, 4], and target = 4
    Output: 6
    Explanation:
    The possible combination ways are:
    [1, 1, 1, 1]
    [1, 1, 2]
    [1, 2, 1]
    [2, 1, 1]
    [2, 2]
    [4]
     */
    vector<int> nums = vector<int>{1, 2, 4};
    REQUIRE(s.backPackVI(nums, 4) == 6);

    /*
    Input: nums = [1, 2], and target = 4
    Output: 5
    Explanation:
    The possible combination ways are:
    [1, 1, 1, 1]
    [1, 1, 2]
    [1, 2, 1]
    [2, 1, 1]
    [2, 2]
     */
    nums = vector<int>{1, 2};
    REQUIRE(s.backPackVI(nums, 4));
}
