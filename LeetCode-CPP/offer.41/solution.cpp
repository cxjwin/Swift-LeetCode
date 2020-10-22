#include <queue>
#include <functional>

using namespace std;

class MedianFinder {
    priority_queue<int, vector<int>, greater<int>> q1; // 小顶堆
    priority_queue<int, vector<int>, less<int>> q2; // 大顶堆

public:
    /** initialize your data structure here. */
    MedianFinder() {
      //
    }
    
    void addNum(int num) {
      if (q1.size() != q2.size()) {
        q1.push(num);
        q2.push(q1.top());
        q1.pop();
      } else {
        q2.push(num);
        q1.push(q2.top());
        q2.pop();
      }
    }
    
    double findMedian() {
      if (q1.size() != q2.size()) {
        return q1.top();
      } else {
        return (q1.top() + q2.top()) / 2.0;
      }
    }
};