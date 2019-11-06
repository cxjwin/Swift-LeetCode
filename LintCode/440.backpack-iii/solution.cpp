//
// Created by smart on 2019/11/6.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>

using namespace std;

class Solution {
public:
    /**
     * @param m: An integer m denotes the size of a backpack
     * @param A: Given n items with size A[i]
     * @param V: Given n items with value V[i]
     * @return: The maximum value
     */
    int backPackIII(int m, vector<int> &A, vector<int> &V) {
        // write your code here

        if (A.empty() || V.empty() || m < 1) {
            return 0;
        }

        vector<int>::size_type n = A.size();

        vector<int> f = vector<int>(m+1, 0);

        for (int i = 1; i <= n; ++i) {
            for (int j = A[i-1]; j <= m; ++j) {
                f[j] = max(f[j], f[j-A[i-1]] + V[i-1]);
            }
        }

        return f[m];
    }
};

TEST_CASE("440", "[backPackIII]") {
    Solution s;

    // Given 4 items with size [2, 3, 5, 7] and value [1, 5, 2, 4], and a backpack with size 10. The maximum value is 15.
    vector<int> A = vector<int>{2, 3, 5, 7};
    vector<int> V = vector<int>{1, 5, 2, 4};
    REQUIRE( s.backPackIII(10, A, V) == 15 );
}