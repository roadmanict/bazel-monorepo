load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

pkg_tar(
    name = "wordpress_base_src",
    srcs = [
        ".htaccess",
        "composer.json",
        "composer.lock",
        "config",
        "vendor",
        "web",
    ],
    mode = "0755",
    package_dir = "/var/www/html",
    strip_prefix = "./",
)

container_image(
    name = "wordpress_base",
    base = "@wordpress//image",
    tars = [":wordpress_base_src"],
)

container_test(
    name = "wordpress_base_test",
    configs = ["//wordpress/base/test_configs:base_wordpress.yaml"],
    image = ":wordpress_base",
)
