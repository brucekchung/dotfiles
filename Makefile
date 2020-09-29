SHELL := bash

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: update-pathogen
update-pathogen: ## Updates pathogen.
	curl -LSso $(CURDIR)/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

.PHONY: update-plugins
update-plugins: ## Updates all plugins.
	git submodule update --init --recursive
	git submodule update --remote
	@if [[ -d "$(CURDIR)/bundle/coc.vim" ]]; then \
		cd $(CURDIR)/bundle/coc.nvim; \
		git checkout release; \
		git reset --hard origin/release; \
	fi
	git submodule foreach 'git pull --recurse-submodules origin `git rev-parse --abbrev-ref HEAD`'

.PHONY: remove-submodule
remove-submodule: ## Removes a git submodule (ex MODULE=bundle/nginx.vim).
	@:$(call check_defined, MODULE, path of module to remove)
	mv $(MODULE) $(MODULE).tmp
	git submodule deinit -f -- $(MODULE)
	$(RM) -r .git/modules/$(MODULE)
	git rm -f $(MODULE)
	$(RM) -r $(MODULE).tmp
