//
// Created by smart on 2020/10/17.
//

#include <unordered_map>

using namespace std;

/*
// Definition for a Node.
*/
class Node {
 public:
  int val;
  Node *next;
  Node *random;

  Node(int _val) {
    val = _val;
    next = nullptr;
    random = nullptr;
  }
};

class Solution {
  Node *dfs(Node *head, unordered_map<Node *, Node *> &visited) {
    if (head == nullptr) {
      return head;
    }
    if (visited.find(head) != visited.end()) {
      return visited[head];
    }
    auto copy = new Node(head->val);
    visited[head] = copy;
    copy->next = dfs(head->next, visited);
    copy->random = dfs(head->random, visited);
    return copy;
  }

 public:
  Node *copyRandomList(Node *head) {
    unordered_map<Node *, Node *> visited;
    return dfs(head, visited);
  }
};

class Solution2 {
 public:
  Node *copyRandomList(Node *head) {
    if (head == nullptr) {
      return head;
    }

    // 1. 将 copy 的 node 放至原 node 的后面
    auto p = head;
    while (p != nullptr) {
      auto copy = new Node(p->val);
      auto next = p->next;
      p->next = copy;
      copy->next = next;
      p = next;
    }
    
    // 2. 赋值 copy 的 random
    p = head;
    while (p != nullptr) {
      auto copy = p->next;
      copy->random = p->random != nullptr ? p->random->next : nullptr;
      p = copy->next;
    }
    
    // 3. 拆分 copy
    p = head;
    auto copy_head = p->next;
    auto q = copy_head;
    while (p != nullptr) {
      p->next = p->next->next;
      q->next = q->next != nullptr ? q->next->next : nullptr;
      p = p->next;
      q = q->next;
    }
    return copy_head;
  }
};