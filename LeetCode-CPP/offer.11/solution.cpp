//
// Created by smart on 2020/10/2.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>

using namespace std;

class Solution {
public:
    int minArray(vector<int>& numbers) {
        if (numbers.size() == 0) {
            return 0;
        }
        int left = 0, right = numbers.size() - 1;
        while (left < right) {
            int mid = left + (right - left) / 2;
            if (numbers[mid] < numbers[right]) {
                right = mid;
            } else if (numbers[mid] > numbers[right]) {
                left = mid + 1;
            } else {
                --right;
            }
        }
        return numbers[left];
    }
};