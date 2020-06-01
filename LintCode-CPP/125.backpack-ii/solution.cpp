//
// Created by smart on 2019/11/4.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>
#include <algorithm>

using namespace std;

class Solution {
public:
    /**
     * @param m: An integer m denotes the size of a backpack
     * @param A: Given n items with size A[i]
     * @param V: Given n items with value V[i]
     * @return: The maximum value
     */
    int backPackII(int m, vector<int> &A, vector<int> &V) {
        // write your code here
        if (m < 1 || A.empty() || V.empty()) {
            return 0;
        }

        int n = A.size();

        vector<int> f = vector<int>(m+1, 0);

        for (vector<int>::size_type i = 1; i <= n; ++i) {
            for (int j = m; j >= A[i - 1]; --j) {
                f[j] = max(f[j], f[j - A[i - 1]] + V[i - 1]);
            }
        }

        return f[m];
    }
};

TEST_CASE("125", "[backPackII]") {
    Solution s;

//    Input: m = 10, A = [2, 3, 5, 7], V = [1, 5, 2, 4]
//    Output: 9
    vector<int> A = vector<int>{2, 3, 5, 7};
    vector<int> V = vector<int>{1, 5, 2, 4};
    REQUIRE( s.backPackII(10, A, V) == 9 );

//    Input: m = 10, A = [2, 3, 8], V = [2, 5, 8]
//    Output: 10
    A = vector<int>{2, 3, 8};
    V = vector<int>{2, 5, 8};
    REQUIRE( s.backPackII(10, A, V) == 10 );
}
