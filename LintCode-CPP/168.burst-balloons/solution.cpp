//
// Created by smart on 2019/11/20.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>

using namespace std;

class Solution {
public:
    /**
     * @param nums: A list of integer
     * @return: An integer, maximum coins
     */
    int maxCoins(vector<int> &nums) {
        // write your code here
        vector<int>::size_type m = nums.size();
        if (m == 0) {
            return 0;
        }

        auto n = m + 2;
        vector<int> nums2 = vector<int>(n);
        nums2[0] = 1;
        nums2[n-1] = 1;
        for (int i = 1; i < n-1; ++i) {
            nums2[i] = nums[i-1];
        }

        vector<vector<int>> f(n, vector<int>(n, 0));

        // f[i][j] = max(f[i][j], f[i][k-1] + f[k+1][j] + nums[k-1]*nums[k]*nums[k+1])
        for (vector<int>::size_type len = 3; len <= n; ++len) {
            for (vector<int>::size_type i = 0; i <= n-len; ++i) {
                vector<int>::size_type j = i + len - 1;
                for (int k = i + 1; k < j; ++k) {
                    f[i][j] = max(f[i][j], f[i][k] + f[k][j] + nums2[i]*nums2[k]*nums2[j]);
                }
            }
        }

        return f[0][n-1];
    }
};

TEST_CASE("168", "[maxCoins]") {
    Solution s;

//    Input：[4, 1, 5, 10]
//    Output：270
//    Explanation：
//    nums = [4, 1, 5, 10] burst 1, get coins 4 * 1 * 5 = 20
//    nums = [4, 5, 10]   burst 5, get coins 4 * 5 * 10 = 200
//    nums = [4, 10]    burst 4, get coins 1 * 4 * 10 = 40
//    nums = [10]    burst 10, get coins 1 * 10 * 1 = 10
//    Total coins 20 + 200 + 40 + 10 = 270
    {
        auto nums = vector<int>{4, 1, 5, 10};
        REQUIRE(s.maxCoins(nums) == 270);
    }

//    Input：[3,1,5]
//    Output：35
//    Explanation：
//    nums = [3, 1, 5] burst 1, get coins 3 * 1 * 5 = 15
//    nums = [3, 5] burst 3, get coins 1 * 3 * 5 = 15
//    nums = [5] burst 5, get coins 1 * 5 * 1 = 5
//    Total coins 15 + 15 + 5  = 35
    {
        auto nums = vector<int>{3,1,5};
        REQUIRE(s.maxCoins(nums) == 35);
    }
}