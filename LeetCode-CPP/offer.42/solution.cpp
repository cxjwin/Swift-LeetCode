#include <vector>

using namespace std;

class Solution {
public:
    int maxSubArray(vector<int>& nums) {
      int n = nums.size();
      int d = nums[0];
      int res = d;
      for (size_t i = 1; i < n; ++i) {
        d = d < 0 ? nums[i] : d + nums[i];
        res = max(res, d);
      }
      return res;
    }
};