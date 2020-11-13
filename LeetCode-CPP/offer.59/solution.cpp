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
  deque<int> q1;
  deque<int> q2;
public:
    MaxQueue() {
      //
    }
    
    int max_value() {
      return q2.empty() ? -1 : q2.front();
    }
    
    void push_back(int value) {
      q1.push_back(value);
      while (!q2.empty() && q2.back() < value) {
        q2.pop_back();
      }
      q2.push_back(value);
    }
    
    int pop_front() {
      if (q1.empty()) {
        return -1;
      }
      int ret = q1.front();
      q1.pop_front();
      if (ret == q2.front()) {
        q2.pop_front();
      }
      return ret;
    }
};
