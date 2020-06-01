//
// Created by smart on 2020/1/7.
//

#define CATCH_CONFIG_MAIN
#include "../catch.hpp"
#include <string>
#include <vector>

using namespace std;

class Solution {
private:
    vector<string> mapping = vector<string> {
            "abc",
            "def",
            "ghi",
            "jkl",
            "mno",
            "pqrs",
            "tuv",
            "wxyz"
    };

    void _combinations(string &digits, int idx, string &str, vector<string> &res) {
        if (idx == digits.length()) {
            cout << str << endl;
            res.push_back(str);
            return;
        }

        string chars = mapping[digits[idx]-'2'];
        for (int i = 0; i < chars.length(); ++i) {
            string temp = str + chars[i];
            _combinations(digits, idx+1, temp, res);
        }
    }

public:
    /**
     * @param digits: A digital string
     * @return: all posible letter combinations
     */
    vector<string> letterCombinations(string &digits) {
        // write your code here
        if (digits.length() == 0) {
            return vector<string>{};
        }

        vector<string> res = vector<string>{};
        string temp = "";
        _combinations(digits, 0, temp, res);
        return res;
    }

    vector<string> letterCombinationsIterative(string &digits) {
        if (digits.length() == 0) {
            return vector<string>{};
        }

        auto res = vector<string>{};
        res.insert(res.end(), "");

        for (int i = 0; i < digits.length(); ++i) {
            string chars = mapping[digits[i]-'2'];
            auto size = res.size();
            for (int j = 0; j < size; ++j) {
                auto temp = res.front();
                res.erase(res.begin());
                for (int k = 0; k < chars.length(); ++k) {
                    auto s = temp + chars[k];
                    cout << s << endl;
                    res.push_back(s);
                }
            }
        }

        return res;
    }
};

TEST_CASE("425-1", "[letterCombinations]") {
    Solution s;
    string digits = "23";
    auto res = s.letterCombinations(digits);

}

TEST_CASE("425-2", "[letterCombinationsIterative]") {
    Solution s;
    string digits = "23";
    auto res = s.letterCombinationsIterative(digits);
}