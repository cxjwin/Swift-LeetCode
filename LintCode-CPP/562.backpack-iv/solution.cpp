//
// Created by smart on 2019/11/6.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>

using namespace std;

class Solution {
public:
    int backPackIV(vector<int> &nums, int target) {
        if (nums.empty()) {
            return 0;
        }

        vector<int>::size_type n = nums.size();

        vector<int> f = vector<int>(target+1, 0);
        f[0] = 1;

        for (int i = 1; i <= n; ++i) {
            for (int j = nums[i-1]; j <= target; ++j) {
                f[j] += f[j-nums[i-1]];
            }
        }

        return f[target];
    }
};

TEST_CASE("562", "[backPackIV]") {
    Solution s;

    /*
    Given candidate items [2,3,6,7] and target 7,
            A solution set is:
    [7]

    [2, 2, 3]
    return 2
     */
    vector<int> nums = vector<int>{2,3,6,7};
    REQUIRE( s.backPackIV(nums, 7) == 2 );
}