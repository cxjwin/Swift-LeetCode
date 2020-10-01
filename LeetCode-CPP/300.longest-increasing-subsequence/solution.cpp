//
// Created by smart on 2020/6/8.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

#include <vector>

using namespace std;

class Solution {
public:
    int lengthOfLISDP(vector<int>& nums) {
        int n = (int)nums.size();
        if (n == 0) {
            return 0;
        }
        vector<int> dp = vector<int>(n, 0);
        dp[0] = 1;
        for (int i = 1; i < n; ++i) {
            dp[i] = 1;
            for (int j = 0; j < i; ++j) {
                if (nums[j] < nums[i]) {
                    dp[i] = max(dp[i], dp[j] + 1);
                }
            }
        }
        return *max_element(dp.begin(), dp.end());
    }

    int lengthOfLIS(vector<int>& nums) {
        int n = (int)nums.size();
        if (n == 0) {
            return 0;
        }
        int len = 1;
        vector<int> d = vector<int>(n + 1, 0);
        d[len] = nums[0];
        for (int i = 1; i < n; ++i) {
            if (nums[i] > d[len]) {
                d[++len] = nums[i];
            } else {
                int l = 1, r = len, pos = 0;
                while (l <= r) {
                    int mid = l + (r-l)/2;
                    if (d[mid] < nums[i]) {
                        pos = mid;
                        l = mid + 1;
                    } else {
                        r = mid - 1;
                    }
                }
                d[pos+1] = nums[i];
            }
        }
        return len;
    }
};

TEST_CASE("300", "[lengthOfLIS]") {
    Solution sl;
    vector<int> nums = {10,9,2,5,3,7,101,18};
    REQUIRE( sl.lengthOfLIS(nums) == 4 );
}

TEST_CASE("300-DP", "[lengthOfLISDP]") {
    Solution sl;
    vector<int> nums = {10,9,2,5,3,7,101,18};
    REQUIRE( sl.lengthOfLISDP(nums) == 4 );
}

