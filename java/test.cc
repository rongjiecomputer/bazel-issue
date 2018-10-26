#include <cstdlib>

int main() {
#ifdef _WIN32
  system("echo %JAVABASE%");
#else
  system("echo $(JAVABASE)");
#endif
}