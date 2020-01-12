load("@npm_bazel_typescript//:index.bzl", "ts_config", "ts_library")

ts_config(
    name = "tsconfig",
    src = "//:nodejs/tsconfig.json",
    deps = [],
)

ts_library(
    name = "grpc-server",
    testonly = 1,
    srcs = glob(["*.ts"]),
    tsconfig = "//:nodejs/tsconfig.json",
    deps = [
        "//nodejs/dependency-injection",
        "@npm//@types/node",
        "@npm//grpc",
    ],
)
