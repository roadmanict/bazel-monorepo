load("@build_bazel_rules_nodejs//:index.bzl", "nodejs_binary")
load("@npm_bazel_typescript//:index.bzl", "ts_library")

nodejs_binary(
    name = "lint",
    args = [
        "--ext=.ts",
        ".",
    ],
    data = [
        "@npm//eslint",
        #        "@npm//@typescript/eslint-plugin",
        #        "@npm//@typescript/parser",
        "//nodejs:.eslintrc.js",
        "//nodejs:.eslintignore",
    ] + glob(["*.ts"]),
    entry_point = "@npm//:node_modules/eslint/bin/eslint.js",
)

ts_library(
    name = "compile",
    srcs = glob(["*.ts"]),
    deps = [
        "@npm//@types/node",
    ],
)
