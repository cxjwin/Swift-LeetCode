#include <vector>

using  namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
      vector<int> res;
      int i = 0, j = nums.size() - 1;
      while (i < j) {
        int sum = nums[i] + nums[j];
        if (sum == target) {
          res.push_back(nums[i]);
          res.push_back(nums[j]);
          break;
        } else if (sum < target) {
          ++i;
        } else {
          --j;
        }
      }
      return res;
    }
};

class SolutionII {
public:
    vector<vector<int>> findContinuousSequence(int target) {
      vector<vector<int>> res;
      for (int l = 1, r = 2; l < r; ) {
        int sum = (l + r) * (r - l + 1) / 2;
        if (sum == target) {
          vector<int> tmp; 
          for (int i = l; i <= r; ++i) {
            tmp.push_back(i);
          }
          res.push_back(tmp);
          ++l;
        } else if (sum < target) {
          ++r;
        } else {
          ++l;
        } 
      }
      return res;
    }
};