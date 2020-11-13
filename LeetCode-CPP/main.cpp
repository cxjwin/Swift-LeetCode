#include <vector>

#define CATCH_CONFIG_MAIN
#include "catch.hpp"

using namespace std;

class Solution {
public:
    /**
     * 二分查找
     * @param n int整型 数组长度
     * @param v int整型 查找值
     * @param a int整型vector 有序数组
     * @return int整型
     */
    int upper_bound_(int n, int v, vector<int>& a) {
        // write code here
        int l = 0, r = n - 1;
        while (l <= r) {
            int mid = l + (r - l) / 2;
            if (a[mid] == v) {
                r = mid - 1;
            } else if (a[mid] < v) {
                l = mid + 1;
            } else {
                r = mid - 1;
            }
        }
        if (l + 1 < n && a[l + 1] == v) {
            return l + 2;
        }
        return n + 1;
    }
};

TEST_CASE( "main", "[upper_bound_]" ) {
    Solution sl = Solution();
    vector<int> a{1,2,4,4,5};
    REQUIRE( sl.upper_bound_(5, 4, a) == 3 );
}
