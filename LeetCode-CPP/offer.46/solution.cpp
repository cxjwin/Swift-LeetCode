#include <string>
#include <vector>

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"

using namespace std;

class Solution {
  int res = 0;

  void dfs(string str, int i) {
    if (i < 0) {
      ++res;
      return;
    }
    dfs(str, i - 1);
    if (i > 0 && (str[i - 1] == '1' || (str[i - 1] == '2' && str[i] < '6'))) {
      dfs(str, i - 2);
    }
  }

public:
  int translateNum(int num) {
    auto str = to_string(num);
    dfs(str, str.length() - 1);
    return res;
  }
};

class Solution2 {
public:
    int translateNum(int num) {
      auto str = to_string(num);
      auto n = str.length();
      int pre2 = 1, pre1 = 1;
      int res = pre1;
      for (int i = 2; i < n + 1; ++i) {
        res = pre1;
        if (str[i - 2] == '1' || (str[i - 2] == '2' && str[i - 1] < '6')) {
          res += pre2;
        }
        pre2 = pre1;
        pre1 = res;
      }
      return res;
    }
};

class Solution3 {
public:
    int translateNum(int num) {
      int pre2 = 1, pre1 = 1;
      int x = num % 10;
      int y = x;
      while (num != 0) {
        num /= 10;
        x = num % 10;
        int z = 10 * x + y;

        int res = pre1;
        if (10 <= z && z <= 25) {
          res += pre2;
        }
        pre2 = pre1;
        pre1 = res;
        y = x;
      }
      return pre1;
    }
};

TEST_CASE("offer_46", "[translateNum]") {
  auto sl = Solution3();
  REQUIRE( sl.translateNum(12258) == 5 );
}