.PHONY: clean install format lint build watch

default: build

all: clean install build

clean:
	@npx bazel clean
	@rm -rf node_modules

install:
	@npm install
	@composer install -d wordpress/base

lint:
	@npx buildifier -r ./

build: lint
	@npx bazel build //...

watch: lint
	@npx ibazel build //...

test: build
	@npx bazel test //...

run_wordpress:
	@npx bazel run wordpress:base_wordpress
	@docker run -p 80:80 bazel/wordpress:base_wordpress
