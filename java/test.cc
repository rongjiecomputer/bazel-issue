#include <cstdlib>
#include <cstdio>

int main() {
#ifdef _WIN32
  system("echo %JAVABASE%");
#else
  system("echo $(JAVABASE)");
  puts(JAR_TOOL_PATH);
#endif
}