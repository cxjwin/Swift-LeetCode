#include <string>
#include <vector>

using namespace std;

class Solution {
public:
    string reverseWords(string s) {
      vector<int> pos;
      pos.push_back(-1);
      for (int i = 0; i < s.length(); ++i) {
        if (s[i] == ' ') {
          pos.push_back(i);
        }        
      }
      pos.push_back(s.length());
      vector<string> res;
      for (int i = 0; i < pos.size() - 1; ++i) {
        int next = pos[i + 1];
        int start = pos[i] + 1;
        int end = next - 1;
        if (start <= end && s[end] != ' ') {
          int len = end - start + 1;
          res.push_back(s.substr(start, len));
        }
      }
      if (res.size() == 0) {
        return "";
      }

      string ret = res[res.size() - 1];
      for (int i = res.size() - 2; i >= 0; --i) {
        ret += " ";
        ret += res[i];
      }
      return ret;
    }
};

class Solution2 {
public:
    string reverseWords(string s) {
      int n = s.length();
      if (n == 0) {
        return "";
      }
      string res;
      int r = n - 1;
      while (r >= 0) {
        while (r >= 0 && s[r] == ' ') {
          --r;
        }
        if (r < 0) {
          break;
        }
        int l = r;
        while (l >= 0 && s[l] != ' ') {
          --l;
        }
        auto sub = s.substr(l + 1, r - l);
        if (res.length() == 0) {
          res = sub;
        } else {
          res = res + " " + sub;
        }
        r = l;
      }
      return res;
    }
};

class SolutionII {
public:
    string reverseLeftWords(string s, int n) {
      string res(s.size(), ' ');
      int j = 0;
      for (int i = n; i < s.size(); ++i) {
        res[j++] = s[i];
      }
      for (int i = 0; i < n; ++i) {
        res[j++] = s[i];
      }
      return res;
    }
};
