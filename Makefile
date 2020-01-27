.PHONY: clean install format lint build

default: build

all: clean install build

clean:
	bazel clean
	rm -rf nodejs/node_modules

install:
	npm install --prefix nodejs

format:
	@find . -type f \( -name "*.bzl" -or -name WORKSPACE -or -name BUILD -or -name BUILD.bazel \) ! -path "*/node_modules/*" | xargs buildifier -v --warnings=attr-cfg,attr-license,attr-non-empty,attr-output-default,attr-single-file,constant-glob,ctx-actions,ctx-args,depset-iteration,depset-union,dict-concatenation,duplicated-name,filetype,git-repository,http-archive,integer-division,load,load-on-top,native-build,native-package,out-of-order-load,output-group,package-name,package-on-top,positional-args,redefined-variable,repository-name,same-origin-load,string-iteration,unsorted-dict-items,unused-variable

lint:
	@make format

build: lint
	bazel build //...

watch: lint
	ibazel build //...