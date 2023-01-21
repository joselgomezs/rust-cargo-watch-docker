envFile ?= .env
include $(envFile)
export $(shell sed 's/=.*//' $(envFile))

.DEFAULT_GOAL=help
.PHONY=help build run up

help: # Prints this target list
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

build: # Build the container
	@docker build -t $(APP_NAME) --build-arg APP_NAME=$(APP_NAME) .

run: # Run container on port configured in `config.env`
	@docker run \
		-v $$(pwd)/src:/app/$(APP_NAME)/src \
		-p=$(PORT):$(PORT) \
		--env-file $$(pwd)/.env \
		--name="$(APP_NAME)" \
		-i -t --rm --init \
		$(APP_NAME)

start: build run # Both build & run commands together