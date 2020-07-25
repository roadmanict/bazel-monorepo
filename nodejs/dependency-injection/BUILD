package(
    default_visibility = ["//nodejs:__subpackages__"],
)

load("@npm//@bazel/typescript:index.bzl", "ts_library")

ts_library(
    name = "dependency-injection",
    srcs = glob(["*.ts"]),
    deps = [
        "@npm//@types/node",
    ],
)
