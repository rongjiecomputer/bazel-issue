#include "registry.h"

CustomCallTargetRegistry* CustomCallTargetRegistry::Global() {
  static auto* registry = new CustomCallTargetRegistry;
  return registry;
}

void CustomCallTargetRegistry::Register(const std::string& symbol,
                                        void* address) {
  std::lock_guard<std::mutex> lock(mu_);
  registered_symbols_[symbol] = address;
}

void* CustomCallTargetRegistry::Lookup(const std::string& symbol) const {
  std::lock_guard<std::mutex> lock(mu_);
  auto it = registered_symbols_.find(symbol);
  return it == registered_symbols_.end() ? nullptr : it->second;
}
