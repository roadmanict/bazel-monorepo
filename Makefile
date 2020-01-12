.PHONY: build

install:
	npm install --prefix nodejs

build:
	bazel build //...