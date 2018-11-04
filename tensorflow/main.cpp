#include <cstdio>
#include <cstdint>
#include <cstddef>

#include "registry.h"

int main() {
  puts("Hello World");
  uintptr_t addr = reinterpret_cast<uintptr_t>(CustomCallTargetRegistry::Global()->Lookup("foo"));
  printf("foo: %zu\n", addr);
  auto f = reinterpret_cast<int(*)()>(addr);
  printf("%d\n", f());
}