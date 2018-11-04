#include <mutex>
#include <unordered_map>

class CustomCallTargetRegistry {
 public:
  static CustomCallTargetRegistry* Global();

  void Register(const std::string& symbol, void* address);
  void* Lookup(const std::string& symbol) const;

 private:
  std::unordered_map<std::string, void*> registered_symbols_;
  mutable std::mutex mu_;
};

class RegisterCustomCallTarget {
 public:
  explicit RegisterCustomCallTarget(const std::string& name, void* address) {
    CustomCallTargetRegistry::Global()->Register(name, address);
  }
};
