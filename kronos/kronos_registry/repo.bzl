OPENGL_HEADERS = ["GL/glcorearb.h", "GL/glext.h", "GL/glxext.h", "GL/wgl.h", "GL/wglext.h"]

_BUILD_CONTENT = """
package(default_visibility = ["//visibility:public"])

cc_library(
    name = "gl_headers",
    hdrs = ["{}"],
    deps = [":khrplatform"],
)

cc_library(
    name = "khrplatform",
    hdrs = ["KHR/khrplatform.h"],
)
""".format("\", \"".join(OPENGL_HEADERS))

def _kronos_registry_impl(ctx):
    for header in OPENGL_HEADERS:
        ctx.download(
            url = "https://github.com/KhronosGroup/OpenGL-Registry/raw/"
                  + ctx.attr.opengl_commit + "/api/" + header,
            output = header,
        )

    ctx.download(
        url = "https://github.com/KhronosGroup/EGL-Registry/raw/"
              + ctx.attr.egl_commit + "/api/KHR/khrplatform.h",
        output = "KHR/khrplatform.h",
    )

    ctx.file("BUILD.bazel", content = _BUILD_CONTENT)

kronos_registry_repo = repository_rule(
    implementation = _kronos_registry_impl,
    local = False,
    attrs = {
        "opengl_commit": attr.string(mandatory=True),
        "egl_commit": attr.string(mandatory=True),
    },
)
