load("@npm_bazel_typescript//:index.bzl", "ts_library")

ts_library(
    name = "grpc-server",
    srcs = glob(["*.ts"]),
    deps = [
        "//nodejs/dependency-injection",
        "@npm//@types/node",
        "@npm//grpc",
    ],
)
