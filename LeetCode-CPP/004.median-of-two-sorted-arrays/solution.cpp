//
// Created by smart on 2020/6/1.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

#include <vector>

using namespace std;

class Solution {
public:
    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {
        int m = nums1.size();
        int n = nums2.size();

        vector<int> merge = vector<int>(m+n, 0);

        int i = 0, j = 0, k = 0;
        while (i < m && j < n) {
            if (nums1[i] <= nums2[j]) {
                merge[k++] = nums1[i++];
            } else {
                merge[k++] = nums2[j++];
            }
        }
        while (i < m) {
            merge[k++] = nums1[i++];
        }
        while (j < n) {
            merge[k++] = nums2[j++];
        }

        int mid = (m + n) / 2;
        if ((m + n) % 2 == 0) {
            return (merge[mid-1] + merge[mid]) / 2.0;
        } else {
            return merge[mid];
        }
    }

    int getKthElement(vector<int>& nums1, vector<int>& nums2, int k) {
        int m = nums1.size(), n = nums2.size();
        int index1 = 0, index2 = 0;
        while (true) {
            if (index1 == m) {
                return nums2[index2 + k - 1];
            }
            if (index2 == n) {
                return nums1[index1 + k  - 1];
            }
            if (k == 1) {
                return min(nums1[index1], nums2[index2]);
            }
            int newIndex1 = min(index1 + k / 2 - 1, m - 1);
            int newIndex2 = min(index2 + k / 2 - 1, n - 1);
            int pivot1 = nums1[newIndex1];
            int pivot2 = nums2[newIndex2];
            if (pivot1 <= pivot2) {
                k -= newIndex1 + 1 - index1;
                index1 = newIndex1 + 1;
            } else {
                k -= newIndex2 + 1 - index2;
                index2 = newIndex2 + 1;
            }
        }
    }

    double findMedianSortedArrays2(vector<int>& nums1, vector<int>& nums2) {
        int m = nums1.size(), n = nums2.size();
        int total = m + n;
        if ((m + n) % 2 == 0) {
            int median1 = getKthElement(nums1, nums2, total / 2);
            int median2 = getKthElement(nums1, nums2, total / 2 + 1);
            return (median1 + median2) / 2.0;
        } else {
            return getKthElement(nums1, nums2, (total + 1) / 2);
        }
    }

    double findMedianSortedArrays3(vector<int>& nums1, vector<int>& nums2) {
        if (nums1.size() > nums2.size()) {
            return findMedianSortedArrays3(nums2, nums1);
        }

        int m = nums1.size(), n = nums2.size();
        int left = 0, right = m;
        int median1 = 0, median2 = 0;

        while (left <= right) {
            int i = (left + right) / 2;
            int j = (m + n + 1) / 2 - i;

            int nums_im1 = i == 0 ? INT_MIN : nums1[i-1];
            int nums_i = i == m ? INT_MAX : nums1[i];
            int nums_jm1 = j == 0 ? INT_MIN : nums2[j-1];
            int nums_j = j == n ? INT_MAX : nums2[j];

            if (nums_im1 <= nums_j) {
                median1 = max(nums_im1, nums_jm1);
                median2 = min(nums_i, nums_j);
                left = i + 1;
            } else {
                right = i - 1;
            }
        }
        return (m + n) % 2 == 0 ? (median1 + median2) / 2.0 : median1;
    }
};

TEST_CASE( "004-1", "[findMedianSortedArrays]" ) {
    Solution sl = Solution();

    // case1
    {
        vector<int> nums1 = {1, 3};
        vector<int> nums2 = {2};
        REQUIRE( sl.findMedianSortedArrays(nums1, nums2) == 2 );
    }

    // case2
    {
        vector<int> nums1 = {1, 2};
        vector<int> nums2 = {3, 4};
        REQUIRE( sl.findMedianSortedArrays(nums1, nums2) == 2.5 );
    }
}

TEST_CASE( "004-2", "[findMedianSortedArrays2]" ) {
    Solution sl = Solution();

    // case1
    {
        vector<int> nums1 = {1, 3};
        vector<int> nums2 = {2};
        REQUIRE( sl.findMedianSortedArrays2(nums1, nums2) == 2 );
    }

    // case2
    {
        vector<int> nums1 = {1, 2};
        vector<int> nums2 = {3, 4};
        REQUIRE( sl.findMedianSortedArrays2(nums1, nums2) == 2.5 );
    }
}

TEST_CASE( "004-3", "[findMedianSortedArrays3]" ) {
    Solution sl = Solution();

    // case1
    {
        vector<int> nums1 = {1, 3};
        vector<int> nums2 = {2};
        REQUIRE( sl.findMedianSortedArrays3(nums1, nums2) == 2 );
    }

    // case2
    {
        vector<int> nums1 = {1, 2};
        vector<int> nums2 = {3, 4};
        REQUIRE( sl.findMedianSortedArrays3(nums1, nums2) == 2.5 );
    }
}
