#include <string>
#include <vector>

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

using namespace std;

class Solution {
 public:
  string minNumber(vector<int>& nums) {
    vector<string> strs(nums.size(), "");
    for (size_t i = 0; i < nums.size(); ++i) {
      strs[i] = to_string(nums[i]);
    }
    sort(strs.begin(), strs.end(), [](string a, string b) {
      return (a + b) < (b + a);
    });
    string res = "";
    for (auto &&str : strs) {
      res += str;
    }
    return res;
  }
};

TEST_CASE("offer_45", "[minNumber]") {
  auto sl = Solution();
  vector<int> nums{3, 30, 5, 34, 9};
  REQUIRE( sl.minNumber(nums) == "3033459" );
}