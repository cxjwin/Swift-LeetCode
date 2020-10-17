//
// Created by smart on 2020/10/17.
//

#include <stack>

using namespace std;

class MinStack {
    stack<int> _st;
    stack<int> _min;
public:
    /** initialize your data structure here. */
    MinStack() {
        //
    }

    void push(int x) {
        _st.push(x);
        if (_min.empty()) {
           _min.push(x);
        } else {
            if (x <= _min.top()) {
                _min.push(x);
            }
        }
    }

    void pop() {
        auto t = _st.top();
        _st.pop();
        if (t == _min.top()) {
            _min.pop();
        }
    }

    int top() {
        return _st.top();
    }

    int min() {
        return _min.top();
    }
};