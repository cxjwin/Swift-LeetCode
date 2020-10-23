#include <vector>
#include <algorithm>
#include <queue>

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

using namespace std;

class Solution {
public:
    vector<int> getLeastNumbers(vector<int>& arr, int k) {
        sort(arr.begin(), arr.end());
        return vector<int>(arr.begin(), arr.begin() + k);
    }
};

class Solution2 {
public:
    vector<int> getLeastNumbers(vector<int>& arr, int k) {
        if (k == 0) {
            return vector<int>{};
        }
        
        priority_queue<int> q;
        for (size_t i = 0; i < k; i++) {
            q.push(arr[i]);
        }
        for (size_t i = k; i < arr.size(); i++) {
            if (arr[i] < q.top()) {
                q.pop();
                q.push(arr[i]);
            }
        }
        vector<int> res(k, 0);
        for (size_t i = 0; i < k; i++) {
            res[i] = q.top();
            q.pop();
        }
        return res;
    }
};

class Solution3 {
    int partion(vector<int> &nums, int l, int r) {
        int pivot = nums[r];
        int i = l;
        for (int j = l; j < r; ++j) {
            if (nums[j] < pivot) {
                swap(nums[i], nums[j]);
                ++i;
            }
        }
        swap(nums[i], nums[r]);
        return i;
    }
    
    int randomizedPartion(vector<int> &nums, int l, int r) {
        int choose = rand() % (r - l + 1) + l; // 随机值
        swap(nums[choose], nums[r]); // 交换
        return partion(nums, l, r);
    }

    void randomizedSelected(vector<int> &nums, int l, int r, int k) {
        if (l >= r) {
            return;
        }
        int pos = randomizedPartion(nums, l, r);
        int num = pos - l + 1;
        if (k == num) {
            return;
        } else if (k < num) {
            randomizedSelected(nums, l, pos - 1, k);
        } else {
            randomizedSelected(nums, pos + 1, r, k - num);
        }
    }

public:
    vector<int> getLeastNumbers(vector<int>& arr, int k) {
        randomizedSelected(arr, 0, arr.size() - 1, k);
        vector<int> res(k, 0);
        for (int i = 0; i < k; ++i) {
            res[i] = arr[i];
        }
        return res;
    }
};

TEST_CASE("offer_40", "[getLeastNumbers]") {
    auto sl = Solution3();
    vector<int> arr{0,0,1,2,4,2,2,3,1,4};
    vector<int> res = sl.getLeastNumbers(arr, 8);
    REQUIRE( res[0] == 0 && res[7] == 3 );
}