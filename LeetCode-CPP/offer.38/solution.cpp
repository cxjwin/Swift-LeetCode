#include <string>
#include <vector>
#include <unordered_set>

using namespace std;

class Solution {
    vector<string> _res;
    vector<char> s;

    void dfs(int x) {
        if (x == s.size() - 1) {
            _res.push_back(string(s.begin(), s.end()));
            return;
        }
        unordered_set<char> set;
        for (int i = x; i < s.size(); ++i) {
            if (set.find(s[i]) != set.end()) {
                continue;
            }
            set.insert(s[i]);
            swap(s[x], s[i]);
            dfs(x + 1);
            swap(s[x], s[i]);
        }
    }

public:
    vector<string> permutation(string ss) {
        s = vector<char>(ss.begin(), ss.end());
        dfs(0);
        return _res;
    }
};

int main() {
    Solution s;
    auto res = s.permutation("aab");
    return 0;
}