#include "registry.h"

extern "C" __declspec(dllexport) int foo() { return 23; }

static RegisterCustomCallTarget foo1("foo", reinterpret_cast<void*>(foo));
