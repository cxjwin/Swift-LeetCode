//
// Created by smart on 2019/11/5.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>

using namespace std;

class Solution {
public:
    /**
     * @param pages: an array of integers
     * @param k: An integer
     * @return: an integer
     */
    int copyBooks(vector<int> &pages, int k) {
        vector<int>::size_type n = pages.size();

        if (n == 0) {
            return 0;
        }

        if (k > n) {
            k = n;
        }

        vector<vector<int>> f = vector<vector<int>>();
        for (int i = 0; i <= k; ++i) {
            vector<int> t = vector<int>(n + 1, 0);
            f.push_back(t);
        }
        for (int i = 1; i <= n; ++i) {
            f[0][i] = INT_MAX;
        }

        int sum = 0;
        for (int t = 1; t <= k; ++t) {
            f[t][0] = 0;
            for (int i = 1; i <= n; ++i) {
                f[t][i] = INT_MAX;
                sum = 0;
                for (int j = i; j >= 0; --j) {
                    f[t][i] = min(f[t][i], max(f[t-1][j], sum));
                    if (j > 0) {
                        sum += pages[j-1];
                    }
                }
            }
        }

        return f[k][n];
    }
};

TEST_CASE("437", "[copyBooks]") {
    Solution s;

    /*
    Input: pages = [3, 2, 4], k = 2
    Output: 5
    Explanation:
    First person spends 5 minutes to copy book 1 and book 2.
    Second person spends 4 minutes to copy book 3.
     */
    vector<int> pages = vector<int>{3, 2, 4};
    REQUIRE( s.copyBooks(pages, 2) == 5 );
}