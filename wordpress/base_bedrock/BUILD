load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

pkg_tar(
    name = "wordpress_base_bedrock_src",
    srcs = [
        ".htaccess",
        "index.php",
    ],
    mode = "0755",
    package_dir = "/var/www/html",
    strip_prefix = "./",
)

pkg_tar(
    name = "wordpress_base_bedrock_repo_src",
    srcs = [
        "repo/config",
        "repo/vendor",
        "repo/web",
    ],
    mode = "0755",
    package_dir = "/var/www/html",
    strip_prefix = "repo",
)

pkg_tar(
    name = "wordpress_base_bedrock_tar",
    mode = "0755",
    deps = [
        ":wordpress_base_bedrock_repo_src",
        ":wordpress_base_bedrock_src",
    ],
)

container_image(
    name = "wordpress_base_bedrock",
    base = "@wordpress//image",
    tars = [":wordpress_base_bedrock_tar"],
)
