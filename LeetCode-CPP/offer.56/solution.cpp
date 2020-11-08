#include <vector>

using namespace std;

class Solution {
public:
    vector<int> singleNumbers(vector<int>& nums) {
      int ret = 0;
      for (auto &&num : nums) {
        ret ^= num;
      }
      int div = 1;
      while ((div & ret) == 0) {
        div <<= 1;
      }
      int a = 0, b = 0;
      for (auto &&num: nums) {
        if (div & num) {
          a ^= num;
        } else {
          b ^= num;
        }
      }
      return vector<int>{a, b};
    }
};

class SolutionII {
public:
    int singleNumber(vector<int>& nums) {
      int ones = 0, twos = 0;
      for (auto &&num : nums) {
        ones = ones ^ num & ~twos;
        twos = twos ^ num & ~ones;
      }
      return ones;
    }
};