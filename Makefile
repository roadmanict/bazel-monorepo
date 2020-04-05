.PHONY: clean install format lint build watch

default: build

all: clean install build

clean:
	@npx bazel clean
	@rm -rf node_modules

install:
	@npm install
	@composer install -d wordpress

lint:
	@npx buildifier -r ./

build: lint
	@npx bazel build //...

watch: lint
	@npx ibazel build //...