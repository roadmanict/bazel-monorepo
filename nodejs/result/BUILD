load("@npm//eslint:index.bzl", "eslint")
load("@npm_bazel_typescript//:index.bzl", "ts_library")

eslint(
    name = "eslint",
    srcs = glob(["**/*.ts"]),
)

ts_library(
    name = "result",
    srcs = glob(["*.ts"]),
    deps = [
        "@npm//@types/node",
    ],
)
