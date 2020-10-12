//
// Created by smart on 2020/10/2.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <stack>

using namespace std;

class CQueue {
    stack<int> pushStack;
    stack<int> popStack;
public:
    CQueue() {
        //
    }

    void appendTail(int value) {
        pushStack.push(value);
    }

    int deleteHead() {
        if (popStack.empty() && pushStack.empty()) {
            return -1;
        }

        if (popStack.empty()) {
            while (!pushStack.empty()) {
                popStack.push(pushStack.top());
                pushStack.pop();
            }
        }

        int val = popStack.top();
        popStack.pop();
        return val;
    }
};