//
// Created by smart on 2019/11/5.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>

using namespace std;

class Solution {
public:
    /*
     * @param nums: A list of integers
     * @return: An integer denotes the sum of max two non-overlapping subarrays
     */
    int maxTwoSubArrays(vector<int> &nums) {
        // write your code here
        if (nums.empty()) {
            return 0;
        }

        vector<int>::size_type n = nums.size();

        // from left to right
        vector<int> localLeft = vector<int>(n, 0);
        vector<int> globalLeft = vector<int>(n, 0);
        localLeft[0] = nums[0];
        globalLeft[0] = nums[0];
        for (vector<int>::size_type i = 1; i < n; ++i) {
            localLeft[i] = max(localLeft[i-1] + nums[i], nums[i]);
            globalLeft[i] = max(globalLeft[i-1], localLeft[i]);
        }

        // from right to left
        vector<int> localRight = vector<int>(n, 0);
        vector<int> globalRight = vector<int>(n, 0);
        localRight[n-1] = nums[n-1];
        globalRight[n-1] = nums[n-1];
        for (vector<int>::size_type i = n-2; i >= 1; --i) {
            localRight[i] = max(localRight[i+1] + nums[i], nums[i]);
            globalRight[i] = max(globalRight[i+1], localRight[i]);
        }

        int maxSum = INT_MIN;
        for (int i = 1; i < n; ++i) {
            maxSum = max(maxSum, globalLeft[i-1] + globalRight[i]);
        }

        return maxSum;
    }

    int maxTwoSubArrays2(vector<int> &nums) {
        if (nums.empty()) {
            return 0;
        }

        vector<int>::size_type n = nums.size();

        vector<int> left = vector<int>(n, 0);

        int totalSum = 0;
        int minSum = 0;
        int maxSum = INT_MIN;
        for (vector<int>::size_type i = 0; i < n; ++i) {
            totalSum += nums[i];
            maxSum = max(maxSum, totalSum - minSum);
            minSum = min(minSum, totalSum);
            left[i] = maxSum;
        }

        vector<int> right = vector<int>(n, 0);

        totalSum = 0;
        minSum = 0;
        maxSum = INT_MIN;
        for (vector<int>::size_type j = n-1; j > 0 ; --j) {
            totalSum += nums[j];
            maxSum = max(maxSum, totalSum - minSum);
            minSum = min(minSum, totalSum);
            right[j] = maxSum;
        }

        maxSum = INT_MIN;
        for (int k = 1; k < n; ++k) {
            maxSum = max(maxSum, left[k-1] + right[k]);
        }

        return maxSum;
    }
};

TEST_CASE("042", "[maxTwoSubArrays]") {
    Solution s;

    /*
    Input:
    [1, 3, -1, 2, -1, 2]
    Output:
    7
    Explanation:
    the two subarrays are [1, 3] and [2, -1, 2] or [1, 3, -1, 2] and [2].
     */
    vector<int> nums = vector<int>{1, 3, -1, 2, -1, 2};
    REQUIRE( s.maxTwoSubArrays(nums) == 7 );

    /*
    Input:
    [5,4]
    Output:
    9
    Explanation:
    the two subarrays are [5] and [4].
     */
    nums = vector<int>{5, 4};
    REQUIRE( s.maxTwoSubArrays(nums) == 9 );

//    [-1,-2,-3,-100,-1,-50]
//    -2
    nums = vector<int>{-1,-2,-3,-100,-1,-50};
    REQUIRE( s.maxTwoSubArrays(nums) == -2 );
}

TEST_CASE("042-2", "[maxTwoSubArrays2]") {
    Solution s;

    /*
    Input:
    [1, 3, -1, 2, -1, 2]
    Output:
    7
    Explanation:
    the two subarrays are [1, 3] and [2, -1, 2] or [1, 3, -1, 2] and [2].
     */
    vector<int> nums = vector<int>{1, 3, -1, 2, -1, 2};
    REQUIRE( s.maxTwoSubArrays2(nums) == 7 );

    /*
    Input:
    [5,4]
    Output:
    9
    Explanation:
    the two subarrays are [5] and [4].
     */
    nums = vector<int>{5, 4};
    REQUIRE( s.maxTwoSubArrays2(nums) == 9 );

//    [-1,-2,-3,-100,-1,-50]
//    -2
    nums = vector<int>{-1,-2,-3,-100,-1,-50};
    REQUIRE( s.maxTwoSubArrays2(nums) == -2 );
}