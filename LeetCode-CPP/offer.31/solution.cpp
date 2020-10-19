//
// Created by smart on 2020/10/17.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>
#include <stack>

using namespace std;

// dfs 超时
class Solution {
    bool _validate(stack<int> &st, vector<int> &pushed, vector<int> &popped) {
        if (pushed.empty() && popped.empty()) {
            return true;
        }
        if (pushed.empty()) {
            if (st.top() == popped.front()) {
                auto v = popped.front();
                st.pop();
                popped.erase(popped.begin());
                bool res = _validate(st, pushed, popped);
                popped.insert(popped.begin(), v);
                st.push(v);
                return res;
            } else {
                return false;
            }
        } else if (popped.empty()) {
            return false;
        }

        // push
        auto v1 = pushed.front();
        st.push(v1);
        pushed.erase(pushed.begin());
        auto r1 = _validate(st, pushed, popped);
        pushed.insert(pushed.begin(), v1);
        st.pop();
        if (!st.empty() && st.top() == popped.front()) {
            // pop
            auto v2 = popped.front();
            st.pop();
            popped.erase(popped.begin());
            auto r2 = _validate(st, pushed, popped);
            popped.insert(popped.begin(), v2);
            st.push(v2);
            return r1 || r2;
        } else {
            return r1;
        }
    }
public:
    bool validateStackSequences(vector<int> &pushed, vector<int> &popped) {
        stack<int> st;
        return _validate(st, pushed, popped);
    }
};

class Solution2 {
public:
    bool validateStackSequences(vector<int>& pushed, vector<int>& popped) {
        stack<int> st;
        auto j = 0;
        for (auto num : pushed) {
            st.push(num);
            while (!st.empty() && st.top() == popped[j]) {
                st.pop();
                ++j;
            }
        }
        return st.empty();
    }
};

TEST_CASE("offer_31", "[validateStackSequences]") {
    auto sl = Solution();
    vector<int> pushed{1,2,3,4,5};
    vector<int> popped{4,5,3,2,1};

    REQUIRE( sl.validateStackSequences(pushed, popped) );
}

TEST_CASE("offer_31_2", "[validateStackSequences]") {
    auto sl = Solution2();
    vector<int> pushed{1,2,3,4,5};
    vector<int> popped{4,5,3,2,1};

    REQUIRE( sl.validateStackSequences(pushed, popped) );
}