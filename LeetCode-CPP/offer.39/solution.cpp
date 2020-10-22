#include <vector>

using namespace std;

class Solution {
public:
    int majorityElement(vector<int>& nums) {
      int votes = 0;
      int x = 0;
      for (auto &&num : nums) {
        if (votes == 0) {
          x = num;
        }
        votes += (x == num ? 1 : -1);
      }
      return x;
    }
};