#include <list>
#include <unordered_map>
#include <vector>

using namespace std;

class LRUCache {
  struct Node {
   int k, v;
  };

public:
  int size;
  list<Node> cache;
  unordered_map<int, list<Node>::iterator> m;

  LRUCache(int capacity) : size(capacity) {
    //
  }

  void set(int k, int v) {
    auto it = m.find(k);
    if (it == m.end()) {
      // if oversize, remove last
      if (cache.size() == size) {
        auto node = cache.back();
        cache.pop_back();
        m.erase(node.k);
      }
    } else {
      cache.erase(it->second);
    }
    cache.push_front(Node{k, v});
    m[k] = cache.begin();
  }

  int get(int k) { 
    auto it = m.find(k);
    if (it == m.end()) {
      return -1;
    }
    cache.splice(cache.begin(), cache, it->second);
    return it->second->v;
  }
};
