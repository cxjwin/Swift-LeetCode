//
// Created by smart on 2019/11/4.
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
     * @return: The maximum size
     */
    int backPack(int m, vector<int> &A) {
        if (A.empty()) {
            return 0;
        }

        vector<int>::size_type n = A.size();

        vector<int> f = vector<int>(m+1, 0);

        for (vector<int>::size_type i = 1; i <= n; ++i) {
            for (int j = m; j >= A[i-1]; --j) {
                f[j] = max(f[j], f[j-A[i-1]] + A[i-1]);
            }
        }

        return f[m];
    }
};

TEST_CASE("092", "[backPack]") {
    Solution s;

//    Input:  [3,4,8,5], backpack size=10
//    Output:  9
    vector<int> A = vector<int>{3,4,8,5};
    REQUIRE( s.backPack(10, A) == 9 );

//    Input:  [2,3,5,7], backpack size=12
//    Output:  12
    A = vector<int>{2,3,5,7};
    REQUIRE( s.backPack(12, A) == 12 );

//    [828,125,740,724,983,321,773,678,841,842,875,377,674,144,340,467,625,916,463,922,255,662,692,123,778,766,254,559,480,483,904,60,305,966,872,935,626,691,832,998,508,657,215,162,858,179,869,674,452,158,520,138,847,452,764,995,600,568,92,496,533,404,186,345,304,420,181,73,547,281,374,376,454,438,553,929,140,298,451,674,91,531,685,862,446,262,477,573,627,624,814,103,294,388]
    A = vector<int>{828,125,740,724,983,321,773,678,841,842,875,377,674,144,340,467,625,916,463,922,255,662,692,123,778,766,254,559,480,483,904,60,305,966,872,935,626,691,832,998,508,657,215,162,858,179,869,674,452,158,520,138,847,452,764,995,600,568,92,496,533,404,186,345,304,420,181,73,547,281,374,376,454,438,553,929,140,298,451,674,91,531,685,862,446,262,477,573,627,624,814,103,294,388};
    REQUIRE( s.backPack(5000, A) == 5000 );
}