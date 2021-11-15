help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup-env: ## Copy sample files 
	bash scripts/setup.sh

run: ## Up the docker-compose without cache or orphans
	go run cmd/flamin-go/main.go

stop: ## Down the docker-compose 
	docker-compose down

logs: ## Display logs of your containers 
	docker-compose logs --follow

lint:
	gofmt -e -l -s -w .

init:
	make setup-env
	make start 
	make logs

.PHONY: help

