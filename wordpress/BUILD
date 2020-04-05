load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

container_image(
    name = "base_wordpress",
    base = "@php//image",
    files = [
        "composer.json",
        "composer.lock",
        #        ".htaccess",
    ] + glob([
        "config/**",
        "vendor/**",
        "web/**",
    ]),
)

container_test(
    name = "base_wordpress_test",
    configs = ["//wordpress/test_configs:base_wordpress.yaml"],
    image = ":base_wordpress",
)
