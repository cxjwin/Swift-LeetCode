#include <string>
#include <unordered_map>
#include <vector>

using namespace std;

class Solution {
public:
    int lengthOfLongestSubstring(string s) {
      int n = s.length();
      int m[128];
      memset(m, -1, sizeof(m));
      int tmp = 0, res = 0;
      for (int j = 0; j < n; ++j) {
        auto ch  = s[j];
        int i = m[ch];
        m[ch] = j;
        tmp = tmp < j - i ? tmp + 1 : j - i;
        res = max(res, tmp);
      }
      return res;
    }
};

class Solution2 {
public:
    int lengthOfLongestSubstring(string s) {
      int n = s.length();
      int m[128];
      memset(m, -1, sizeof(m));
      int i = -1, res = 0;
      for (int j = 0; j < n; ++j) {
        auto ch  = s[j];
        i = max(i, m[ch]);
        m[ch] = j;
        res = max(res, j - i);
      }
      return res;
    }
};