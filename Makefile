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
	@npx bazel run wordpress/base:wordpress_base
	@docker run -p 80:80 \
		--network bazel-monorepo_wordpress \
		-e DB_NAME=roadman_wp_vogel \
		-e DB_USER=roadman_wp_vogel \
		-e DB_PASSWORD=devpass \
		-e DB_HOST=mysql_db:3306 \
		-e WP_ENV=development \
		-e WP_HOME=http://localhost \
		-e WP_SITEURL=${WP_HOME}/wp \
		bazel/wordpress/base:wordpress_base