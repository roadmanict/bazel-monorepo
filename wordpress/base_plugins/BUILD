load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

pkg_tar(
    name = "wordpress_base_plugins_src",
    srcs = [
        "vendor_plugins",
        "web",
    ],
    mode = "0755",
    package_dir = "/var/www/html",
)

pkg_tar(
    name = "wordpress_base_plugins_tar",
    mode = "0755",
    deps = [
        ":wordpress_base_plugins_src",
        "//wordpress/base_bedrock:wordpress_base_bedrock_tar",
    ],
)

container_image(
    name = "wordpress_base_plugins",
    base = "@wordpress//image",
    tars = [":wordpress_base_plugins_tar"],
)
