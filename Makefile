.PHONY: clean install format lint build watch

default: build

all: clean install build

clean:
	@npx bazel clean
	@rm -rf node_modules

install:
	@npm ci
	@composer install -d wordpress/base
	@composer install -d wordpress/base_bedrock/repo

lint:
	@npx buildifier -r ./

build: lint
	@npx bazel build //...

watch: lint
	@npx ibazel build //...

test: build
	@npx bazel test //...

run_wordpress:
	@npx bazel run wordpress/base_bedrock:wordpress_base_bedrock
	@docker run -p 80:80 \
		--network bazel-monorepo_wordpress \
		-e DB_NAME=roadman_wp_vogel \
		-e DB_USER=roadman_wp_vogel \
		-e DB_PASSWORD=devpass \
		-e DB_HOST=mysql_db:3306 \
		-e WP_ENV=development \
		-e WP_HOME=http://localhost \
		-e WP_SITEURL=http://localhost/wp \
		bazel/wordpress/base_bedrock:wordpress_base_bedrock