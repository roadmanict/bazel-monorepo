load("@npm//@bazel/typescript:index.bzl", "ts_library")
load("@npm//@bazel/jasmine:index.bzl", "jasmine_node_test")

ts_library(
    name = "result",
    srcs = glob(["*.ts"]),
    deps = [
        "@npm//@types/node",
    ],
)

ts_library(
    name = "spec",
    srcs = glob(["spec/*.ts"]),
    deps = [
        ":result",
        "@npm//@types/jasmine",
        "@npm//@types/node",
    ],
)

jasmine_node_test(
    name = "test",
    srcs = [
        ":spec",
    ],
    deps = [
        "@npm//jasmine",
    ],
)
