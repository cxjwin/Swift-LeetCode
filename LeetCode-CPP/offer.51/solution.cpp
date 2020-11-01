#include <vector>

using namespace std;

class Solution {
  int mergeSort(vector<int>& nums, int l, int r) {
    if (l >= r) {
      return 0;
    }
    int mid = l + (r - l) / 2;
    int inv_count = mergeSort(nums, l, mid) + mergeSort(nums, mid + 1, r);
    int n = r - l + 1;
    vector<int> tmp(n, 0);
    int i = l, j = mid + 1, k = 0;
    while (i <= mid && j <= r) {
      if (nums[i] <= nums[j]) {
        tmp[k++] = nums[i++];
        inv_count += (j - (mid + 1));
      } else {
        tmp[k++] = nums[j++];
      }
    }
    while (i <= mid) {
      tmp[k++] = nums[i++];
      inv_count += (j - (mid + 1));
    }
    while (j <= r) {
      tmp[k++] = nums[j++];
    }
    // copy to dest
    copy(tmp.begin(), tmp.end(), nums.begin() + l);
    return inv_count;
  }
 public:
  int reversePairs(vector<int>& nums) {
    return mergeSort(nums, 0, nums.size() - 1);
  }
};