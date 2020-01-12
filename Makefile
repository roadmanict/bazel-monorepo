.PHONY: build

install:
	npm install

build:
	bazel build //...