#include <vector>

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

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
        int l = 0, r = n;
        while (l < r) {
            int mid = l + (r - l) / 2;
            if (a[mid] == v) {
                r = mid;
            } else if (a[mid] < v) {
                l = mid + 1;
            } else if (a[mid] > v) {
                r = mid;
            }
        }
        if (a[l] == v) {
            return l + 1;
        }
        return n + 1;
    }
};

// TEST_CASE( "local.1", "[upper_bound_]" ) {
//     Solution sl = Solution();
//     vector<int> a{2,3,4,4,4,7,7,8,10,10,11,12,13,14,15,15,17,18,19,23,24,24,24,24,25,26,26,26,27,27,28,29,29,30,33,36,38,38,40,40,41,43,43,43,44,46,46,47,51,52,52,53,54,56,57,57,57,58,58,61,61,61,62,64,64,66,66,67,67,67,70,72,74,74,74,75,75,78,78,78,79,79,80,83,83,83,83,84,84,86,88,89,89,90,91,91,92,93,93,96};
//     REQUIRE( sl.upper_bound_(100, 1, a) == 4 );
// }

class Solution2 {
public:
    vector<vector<string>> cut(vector<vector<string>> &input, int k) {
        int n = input.size();
        vector<int> lens;
        for (auto &&p : input) {
            lens.push_back(p.size());
        }
        vector<vector<string>> res;
        vector<int> cuts;
        cuts.push_back(0);
        for (int i =  0; i < n; ++i) {
            int cur = lens[i];
            int last = cuts.back();
            if (cur + last <= k) {
                // 如果当前段落还能填充, 继续追加到当前
                cuts[cuts.size() - 1] = cur + last;
                if (res.empty()) {
                    res.push_back(input[i]);
                } else {
                    auto arr = res[res.size() - 1];
                    arr.insert(arr.end(), input[i].begin(), input[i].end());
                    res[res.size() - 1] = arr;
                }
            } else if (cur <= k) {
                // 如果当前段落不能填充, 且后面能够显示下, 追加到后面
                cuts.push_back(cur);
                res.push_back(input[i]);
            } else {
                // 如果当前段落不能填充, 且后面一页显示不下, 需要截取多端
                auto it = input[i].begin();
                while (cur >= k) {
                    cuts.push_back(k);
                    cur -= k;
                    res.push_back(vector(it, it +  k));
                    it += k;
                }
                if (cur > 0) {
                    cuts.push_back(cur);
                    res.push_back(vector(it, it +  cur));
                }
            }
        }
        return res;
    }
};

TEST_CASE( "local.2", "[cut]" ) {
    Solution2 sl = Solution2();
    vector<vector<string>> case1 = vector<vector<string>>{
        {"a", "b"},
        {"c", "d"},
    };
    auto res1 = sl.cut(case1, 5);
    REQUIRE( res1[0].size() == 2 );
    REQUIRE( res1[1].size() == 2 );

    vector<vector<string>> case2 = vector<vector<string>>{
        {"a", "b", "c"},
        {"c", "d", "e", "f", "g"},
    };
    auto res2 = sl.cut(case2, 5);
    REQUIRE( res2[0].size() == 3 );
    REQUIRE( res2[1].size() == 5 );

    vector<vector<string>> case3 = vector<vector<string>>{
        {"a", "b", "c"},
        {"c", "d", "e", "f", "g", "h"},
        {"h", "i"},
    };
    auto res3 = sl.cut(case3, 5);
    REQUIRE( res3[0].size() == 3 );
    REQUIRE( res3[1].size() == 5 );
    REQUIRE( res3[2].size() == 3 );

    vector<vector<string>> case4 = vector<vector<string>>{
        {"a", "b", "c"},
        {"c", "d", "e", "f", "g", "h", "c", "d", "e", "f", "g", "h"},
        {"h", "i"},
    };
    auto res4 = sl.cut(case4, 5);
    REQUIRE( res4[0].size() == 3 );
    REQUIRE( res4[1].size() == 5 );
    REQUIRE( res4[2].size() == 5 );
    REQUIRE( res4[3].size() == 4 );
}