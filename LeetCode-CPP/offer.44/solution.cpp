#include <string>

using namespace std;

class Solution {
public:
    int findNthDigit(int n) {
      long digit = 1, start = 1, count = 9;
      while (n > count) {
        n -= count;
        start *= 10;
        ++digit;
        count = 9 * start * digit;
      }
      int num = start + (n - 1) / digit;
      auto str = to_string(num);
      return str[(n - 1) % digit] - '0';
    }
};