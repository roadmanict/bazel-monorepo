load("@npm_bazel_typescript//:index.bzl", "ts_library")

ts_library(
    name = "grpc-server",
    testonly = 1,
    srcs = glob(["*.ts"]),
    deps = [
        "@npm//@types/node",
        "@npm//grpc",
        "//dependency-injection:dependency-injection",
    ],
)

filegroup(
    name = "grpc-server.js",
    srcs = ["grpc-server"],
)