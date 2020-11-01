#include <algorithm>
#include <vector>

using namespace std;

class Solution {
 public:
  int nthUglyNumber(int n) {
    vector<int> f(n, 0);
    f[0] = 1;
    int a = 0, b = 0, c = 0;
    for (int i = 1; i < n; ++i) {
      f[i] = min({f[a] * 2, f[b] * 3, f[c] * 5});
      if (f[i] == f[a] * 2) ++a;
      if (f[i] == f[b] * 3) ++b;
      if (f[i] == f[c] * 5) ++c;
    }
    return f[n - 1];
  }
};
