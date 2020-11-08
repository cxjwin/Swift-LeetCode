#include <vector>
#include <deque>

using namespace std;

class Solution {
public:
    vector<int> maxSlidingWindow(vector<int>& nums, int k) {
      vector<int> res;
      if (nums.size() == 0) {
        return res;
      }
      deque<int> q;
      for (int i = 0; i < k; ++i) {
        while (!q.empty() && q.back() < nums[i]) {
          q.pop_back();
        }
        q.push_back(nums[i]);
      }
      res.push_back(q.front());
      for (int i = k; i < nums.size(); ++i) {
        if (q.front() == nums[i - k]) {
          q.pop_front();
        }
        while (!q.empty() && q.back() < nums[i]) {
          q.pop_back();
        }
        q.push_back(nums[i]);
        res.push_back(q.front());
      }
      return res;
    }
};

class MaxQueue {
public:
    MaxQueue() {

    }
    
    int max_value() {

    }
    
    void push_back(int value) {

    }
    
    int pop_front() {

    }
};
