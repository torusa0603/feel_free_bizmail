.DEFAULT_GOAL = help
help: ## helpを表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
.PHONY: help

build: ## generate .g file and .freezed file
	flutter pub run build_runner build --delete-conflicting-outputs
.PHONY:build
