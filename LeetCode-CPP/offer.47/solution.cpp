#include <vector>

using namespace std;

class Solution {
public:
    int maxValue(vector<vector<int>>& grid) {
      int m = grid.size();
      if (m == 0) {
        return 0;
      }
      int n = grid[0].size();
      if (n == 0) {
        return 0;
      }
      vector<vector<int>> f(m, vector<int>(n, 0));
      for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
          if (i == 0 && j == 0) {
            f[i][j] = grid[i][j];
          } else if (i == 0) {
            f[i][j] = f[i][j - 1] + grid[i][j];
          } else if (j == 0) {
            f[i][j] = f[i - 1][j] + grid[i][j];
          } else {
            f[i][j] = max(f[i][j - 1], f[i - 1][j]) + grid[i][j];
          }
        }
      }
      return f[m - 1][n - 1];
    }
};