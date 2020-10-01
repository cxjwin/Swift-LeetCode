//
// Created by smart on 2020/6/11.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

#include <vector>

using namespace std;

class Solution {
public:
    void sortColors(vector<int>& nums) {
        int n = nums.size();
        int i = 0, j = 0, k = n - 1;
        while (j <= k) {
            if (nums[j] == 0) {
                swap(nums[i], nums[j]);
                ++i;
                ++j;
            } else if (nums[j] == 1) {
                ++j;
            } else {
                swap(nums[j], nums[k]);
                --k;
            }
        }
    }

    void sortColors2P(vector<int>& nums) {
        int n1 = 0, n2 = 0, n3 = 0;
        for (auto &&num : nums) {
            if (num == 0) {
                ++n1;
            } else if (num == 1) {
                ++n2;
            } else {
                ++n3;
            }
        }
        for (int i = 0; i < nums.size(); ++i) {
            if (i < n1) {
                nums[i] = 0;
            } else if (i < n1 + n2) {
                nums[i] = 1;
            } else {
                nums[i] = 2;
            }
        }
    }
};

TEST_CASE("075-OnePass", "[sortColors]") {
    Solution sl;
    vector<int> nums = {2,0,2,1,1,0};
    sl.sortColors(nums);
    vector<int> res = {0,0,1,1,2,2};
    REQUIRE( nums == res );
}