.PHONY: clean install format lint build watch

default: build

all: clean install build

clean:
	@npx @bazel/bazelisk clean
	@rm -rf node_modules

install:
	@npm ci
	@git submodule update
	@composer install -d wordpress/base_bedrock/repo
	@composer install -d wordpress/base_plugins

lint:
	@npx @bazel/buildifier -r ./

build: lint
	@npx @bazel/bazelisk build //...

watch: lint
	@npx @bazel/ibazel build //...

test: build
	@npx @bazel/ibazel test --test_output=streamed //...

run_wordpress:
	@npx bazelisk run wordpress/base_plugins:wordpress_base_plugins
	@docker run -p 80:80 \
		--network bazel-monorepo_wordpress \
		-e DB_NAME=roadman_wp_vogel \
		-e DB_USER=roadman_wp_vogel \
		-e DB_PASSWORD=devpass \
		-e DB_HOST=mysql_db:3306 \
		-e WP_ENV=development \
		-e WP_HOME=http://localhost \
		-e WP_SITEURL=http://localhost/wp \
		bazel/wordpress/base_plugins:wordpress_base_plugins