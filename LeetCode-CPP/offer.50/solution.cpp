#include <string>

using namespace std;

class Solution {
public:
    char firstUniqChar(string s) {
      int m[26];
      for (auto &&c : s) {
        ++m[c - 'a'];
      }
      for (auto &&c : s) {
        if (m[c - 'a'] == 1) {
          return c;
        }
      }
      return ' ';
    }
};