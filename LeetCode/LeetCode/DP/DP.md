# DP

前前后后看了好几次的动态规划, 每次看过就忘了, 所以这次打算系统的记录下笔记, 也好便于以后回顾.
这里看到一篇总结的很好的博客, 虽然浏览量不是很多, 不过个人觉的真的很好.

动态规划的实质: 根据小问题的结果来推断大问题的结果

记忆化搜索
避免中间重复的计算结果

什么时候使用动态规划:

1. 求最大/最小值
2. 判断是否可行
3. 统计方案个数

什么时候不用动态规划:

1. 求出所有具体的方案而非方案个数
2. 输入数据是一个集合而不是序列
3. 暴力算法的复杂度已经是多项式级别

动态规划擅长优化指数级别复杂度（2^n, n!）到多项式级别复杂度（n^2, n^3）
不擅长优化n^3到n^2

动态规划4要素:
状态 - 存储小规模问题的结果
方程 - 状态之间的联系, 怎么通过小的状态来算大的状态
初始化 - 最极限的小状态是什么, 起点
答案 - 最大的那个状态是什么, 终点

常见的动态规划类型:

## 1. 坐标型动态规划

state:
f[i] 表示从起点走到坐标i...
f[i][j] 表示从起点走到坐标(i,j)...

function: 研究走到i或(i,j)这个点之前的一步

initialize: 起点

answer: 终点

### 1.1 Minimum Path Sum

注意: 对于二维数组的判断, a == NULL || a.length == 0 || a[0].length == 0

state: f[i][j] 从起点走到(i,j)的最小路径

function: f[i][j] = min(f[i - 1][j], f[i][j - 1]) + A[i][j];

initialize: f[i][0] = sum(0,0~i,0)

　　　　　　　f[0][i] = sum(0,0,0~i)

answer: f[m - 1][n - 1]

记住: 初始化一个二维的动态规划时, 就去初始化第0行和第0列

### 1.2 Unique Paths

state: f[i][j] 表示从起点到(i,j)的路径数

function: f[i][j] = f[i - 1][j] + f[i][j - 1]

initialize: f[0][i] = 1; f[i][0] = 1;

answer: f[m - 1][n - 1]

### 1.3 Jump Game

state: f[i] 表示从起点到位置i是否能够跳到

function:

```swift
for i in 1..<n {
    for j in 0..<i {
        if f[j] && j + nums[j] >= i {
            f[i] = true
            break;
        }
    }
}
```

initialize: f[0] = true

answer: f[n-1]

### 1.4 Jump Game 2

state: f[i] 表示从起点到位置i需要的最小跳数

function:

```swift
for i in 1..<n {
    f[i] = Int.max
    for j in 0..<i {
        if f[j] != Int.max && j + nums[j] >= i {
            f[i] = f[j] + 1
            break;
        }
    }
}
```

initialize: f[0] = 0

answer: f[n-1]

### 1.5 Longest Increasing Subsequence

state: f[i] 表示从起点到位置i最长递增子序列长度

function:

```swift
for i in 1..<n {
    if nums[i] > nums[i-1] {
        f[i] = f[i-1] + 1
    } else {
        f[i] = f[i-1]
    }
}
```

initialize: f[0] = 1 // 它自己

answer: f[n-1]

### 1.6 Maximal Square

state: f[i][j] 表示(1,j)为右下角的最长正方形边长

function:

```swift
for i in 1..<m {
    for j in 1..<n {
        if matrix[i][j] == "1" {
            f[i][j] = min(f[i-1][j-1], min(f[i-1][j], f[i][j-1])) + 1
            result = max(f[i][j], result)
        } else {
            f[i][j] = 0
        }
    }
}
```

initialize:

```swift
f[0][0] = matrix[0][0] == "1" ? 1 : 0
for i in 1..<m {
    f[i][0] = matrix[i][0] == "1" ? 1 : 0
}
for j in 1..<n {
    f[0][j] = matrix[0][j] == "1" ? 1 : 0
}
```

answer: f[0][0] ~ f[m-1][n-1] 中最大值的乘积

## 2. 序列型动态规划

state: f[i]表示**前i**个位置／数字／字符, 第i个...

function: f[i] = f[j]...  j是i之前的一个位置

initialize: f[0]...

answer: f[n]...

一般answer是f(n)而不是f(n - 1) 因为对于n个字符, 包含前0个字符(空串), 前1个字符...前n个字符.

注意: 如果不是跟坐标相关的动态规划, 一般有n个数／字符, 就开n＋1个位置的数组, 第0个位置单独留出来作初始化.

2.1 word break 

state: f[i]表示前i个字符是否可以 Word Break

function:

```swift
for i in 1..<n {
    for j in 0..<i {
        
    }
}
```

initialize: f[0] = true

answer: f[n]

2.2 word break ii

2.3 House Robber

很简单的一道单序列动态规划问题 f[i]的状态只与f[i - 1]和f［i - 2] 相关

state: f[i]

function: max(f[i - 1], f[i - 2] + A[i - 1])

initialize: f[0] = 0; // 当没有house可抢的时候为0

　　　　　　　f[1] = A[0]; // 当只有1个house的时候，为house的当前值

answer: f[size]

2.4 House Robber ii

即首尾点不能同时取.

正确的思路: 区分加不加首点, 直接2种情况下分别做动态规划!

在不同情况下, 分情况做多次dp或者其他算法, 不会影响整体的时间复杂度, 分情况套用一个helper function!

2.5 House Robber iii

2.6 Decode ways

典型的序列型动态规划, 记住, 开n＋1个位置, 从空串的位置开始 很重要!!!

空串的初始化, 应该为1而不是0, 因为空串也作为一个合理的decode方式. 

注意, dp[i]的状态依赖于dp[i - 1] 和 dp[i - 2]

dp[i]是2者的累加和, 所以分别考虑是否需要添加该部分.

2.7 Coin Change

dp[i]: 表示组成面值i所需的最小的coin个数.

注意, 面值为0的时候, 直接返回0

先把所有的dp[i]都变成max的int

返回的时候, 如果dp[k] = Math.MAX_VALUE, 那么返回－1, 这个需要最后单独做处理

2.8 Integer break

## 3. 双序列动态规划

state: f[i][j]代表了第一个sequence的前i个数字／字符, 配上第二个sequence的前j个...

function: f[i][j] = 研究第i个和第j个的匹配关系

initialize: f[i][0] 和 f[0][i]

answer: f[n][m]

n = s1.length(); m = s2.length()

3.1 Longest Common Subsequence

LCS经典问题

state: f[i][j] 表示第一个字符串的前i个字符配上第二个字符串的前j个字符的LCS长度

function: 注意研究的是第i个字符和第j个字符的关系 a[i - 1] 与 b[j - 1]的关系
if (a[i - 1] == b[j - 1]) {
    f[i][j] = f[i - 1][j - 1] + 1;
} else {
    [i][j] = max(f[i - 1][j], f[i][j - 1]);
}　　　　　　

initialize: f[i][0] = 0; f[0][j] = 0;

answer: f[n][m];

类似问题: 比较当前的char是否相同 Longest Common Substring

很巧妙的在while循环里利用 i＋len 作为控制条件!

3.2 Edit distance

state: f[i][j] 表示a的前i个字符最少要几次编辑可以变成b的前j个字符

function: 
if (a[i - 1] == b [j - 1]) {
    dis[i][j] = dis[i - 1][j - 1];
} else {
    dis[i][j] = Math.min(dis[i - 1][j] + dis[i][j - 1]) + 1;　// 注意是3种情况 不是2种  ❌　
    dis[i][j] = Math.min(dis[i - 1][j], Math.min(dis[i][j - 1], dis[i - 1][j - 1])) + 1;　// 增删改三种 ✅
}

initialize: f[i][0] = i; f[0][j] = j;

answer: f[m][n]

3.3 Interleaving String

state: f[i][j] 表示a的前i个字符和b的前j个字符能否交替组成s3的前i ＋ j个字符

function:  
if ((f[i - 1][j] && a.charAt(i - 1) == s3.charAt(i + j - 1)) || 
    (f[i][j - 1] && b.charAt(j - 1) == s3.charAt(i + j - 1))) {
    f[i][j] = true;
} else {
    f[i][j] = false;
}

initialize: 
f[i][0] = f[i-1][0] && a[i-1] == s3[i-1]; 
f[0][j] = f[0][j] && b[j-1] == s3[i-1];

answer: f[m][n]

3.4 Distinct Subsequence

state: f[i][j]表示s的前i个字符中选取t的前j个字符有多少种方案

function:
if (s[i - 1] == t[j - 1]) {
    dp[i][j] = dp[i - 1][j - 1] ＋ dp[i][j - 1];
} else {
    dp[i][j] = dp[i - 1][j];
}

initialize:
m = s.count
n = t.count
f[i][0] = 1; // 当目标为空串时, 无论source的长度是多少都认为是1个
f[0][j] = 0; // (j > 0) 当两个都为空串的时候, 认为是1

answer: f[m][n]

## 4. 划分型动态规划

在一个大的区间内找一个小的区间.
划分类的题目, 基本思路都是用一个local数组和一个gobal数组, 然后进行遍历.
之所以可以用变量来代替数组, 是因为做了**滚动数组**的优化!

### 4.1 Maximum Subarray

在一个数组里找一个连续的部分， 使得累加和最大

state:  local[i] 表示包括第i个元素能找到的最大值
        gobal[i] 表示全局前i个元素中能找到的最大值

function:
        local[i] = max(local[i - 1] + nums[i], nums[i]);
        gobal[i] = max(gobal[i - 1], local[i]);

initialization:
        local[0] = gobal[0] = nums[0];

answer: gobal[size - 1];

### 4.2 Maximum Product Subarray

这道题跟 Maximum Subarray 模型上和思路上都比较类似, 还是用一维动态规划中的"局部最优和全局最优法". 这里的区别是维护一个局部最优不足以求得后面的全局最优, 这是由于乘法的性质不像加法那样, 累加结果只要是正的一定是递增, 乘法中有可能现在看起来小的一个负数. 后面跟另一个负数相乘就会得到最大的乘积. 不过事实上也没有麻烦很多, 我们只需要在维护一个局部最大的同时, 在维护一个局部最小, 这样如果下一个元素遇到负数时, 就有可能与这个最小相乘得到当前最大的乘积和, 这也是利用乘法的性质得到的.

维护了最大最小2个数组!
state:
    min[i] 表示前i个数包括第i个数找到的最小乘积
    max[i] 表示前i个数包括第i个数找到的最大乘积
function:
    min[i] = min(nums[i], min(min[i - 1]) * nums[i], max[i - 1] * nums[i]) 
    区分nums[i]正负!!!
    max[i] = max(max[i], max(min[i - 1]) * nums[i], max[i - 1] * nums[i])

### 4.3 Best Time to Buy and Sell Stock

### 4.4 Best Time to Buy and Sell Stock II

### 4.5 Best Time to Buy and Sell Stock III

### 4.6 Best Time to Buy and Sell Stock IV

对于2次的题目,一定要想到从左到右和从右到左2次!!!
