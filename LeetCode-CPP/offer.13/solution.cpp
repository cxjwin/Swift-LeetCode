//
// Created by smart on 2020/10/5.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <vector>
#include <queue>

using namespace std;

class Solution {
    int bitSum(int x) {
        int sum = 0;
        for (; x > 0; x /= 10) {
            sum += (x % 10);
        }
        return sum;
    }
    int dfs(int m, int n, int i, int j, int k, vector<vector<bool>> &visited) {
        if (i < 0 || j < 0 || i >= m || j >= n || (bitSum(i) + bitSum(j)) > k || visited[i][j]) {
            return 0;
        }
        visited[i][j] = true;
        return 1 + dfs(m, n, i+1, j, k, visited) + dfs(m, n, i, j+1, k, visited);
    }
public:
    // dfs
    int movingCount(int m, int n, int k) {
        vector<vector<bool>> visited(m, vector<bool>(n, false));
        return dfs(m, n, 0, 0, k, visited);
    }
    // bfs
    int movingCount2(int m, int n, int k) {
        vector<vector<bool>> visited(m, vector<bool>(n, false));
        int res = 0;
        queue<vector<int>> q;
        q.push(vector<int>{0, 0, 0});
        while (!q.empty()) {
            auto front = q.front();
            q.pop();
            int i = front[0], j = front[1], sum = front[2];
            if (i < 0 || j < 0 || i >= m || j >= n || sum > k || visited[i][j]) {
                continue;
            }
            ++res;
            visited[i][j] = true;
            q.push(vector<int>{i+1, j, bitSum(i+1) + bitSum(j)});
            q.push(vector<int>{i, j+1, bitSum(i) + bitSum(j+1)});
        }
        return res;
    }
};

