cc_test(
    name = "test",
    srcs = ["test.cc"],
    copts = ["-DJAR_TOOL_PATH=\\\"$(JAVABASE)/bin/jar\\\""],
    data = ["@bazel_tools//tools/jdk:current_java_runtime"],
    toolchains = ["@bazel_tools//tools/jdk:current_java_runtime"],
) 
