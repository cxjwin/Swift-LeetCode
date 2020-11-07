#include <vector>

using namespace std;

class Solution {
 public:
  int search(vector<int>& nums, int target) {
    int l = 0, r = nums.size() - 1;
    while (l <= r) {
      int mid = l + (r - l) / 2;
      if (nums[mid] <= target) {
        l = mid + 1;
      } else {
        r = mid - 1;
      }
    }
    if (l == 0) {
      return 0;
    }
    int count = 0;
    for (int i = l - 1; i >= 0; --i) {
      if (nums[i] == target) {
        ++count;
      } else {
        break;
      }
    }
    return count;
  }
};

class Solution2 {
  int count = 0;

  void helper(vector<int>& nums, int l, int r, int target) {
    if (l > r) {
      return;
    }
    int mid = l + (r - l) / 2;
    if (nums[mid] == target) {
      ++count;
      helper(nums, l, mid - 1, target);
      helper(nums, mid + 1, r, target);
    } else if (nums[mid] < target) {
      helper(nums, mid + 1, r, target);
    } else {
      helper(nums, l, mid - 1, target);
    }
  }
 public:
  int search(vector<int>& nums, int target) {
    helper(nums, 0, nums.size() - 1, target);
    return count;
  }
};

class Solution3 {
  int helper(vector<int>& nums, int target) {
    int l = 0, r = nums.size() - 1;
    int mid = l;
    while (l <= r) {
      mid = l + (r - l) / 2;
      if (target <= nums[mid]) {
        r = mid - 1;
      } else {
        l = mid + 1;
      }
    }
    
    return mid;
  }
 public:
  int search(vector<int>& nums, int target) {
    int r = helper(nums, target);
    int l = helper(nums, target - 1);
    return r - l;
  }
};


class SolutionII {
public:
    int missingNumber(vector<int>& nums) {
      int n = nums.size(); // 从0开始
      int l = 0, r = nums.size() - 1;
      while (l <= r) {
        int m = l + (r - l) / 2;
        if (nums[m] == m) {
          l = m + 1;
        } else {
          r = m - 1;
        }
      }
      return l;
    }
};