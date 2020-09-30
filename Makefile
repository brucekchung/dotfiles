SHELL := bash #TODO - should this be zsh?

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

#TODO - make git submodule and remove copy?
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

.PHONY: symlink
symlink: ## Sets up symlink for user and root .vimrc for vim - UNTESTED
	# ln -snf "$(PWD)/.vimrc" "$(HOME)/.vimrc"
	# sudo ln -snf "$(HOME)/.vim" /root/.vim
	# sudo ln -snf "$(HOME)/.vimrc" /root/.vimrc

.PHONY: set-macros
set-macros: ## Set system defaults TODO-set elsewhere
	defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
	defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)

.PHONY: list-env
list-env: ## List applicable environmental variables
	@echo "HOME - ${HOME}"
	@echo "PWD - ${PWD}"
	@echo "LC_TERMINAL - ${LC_TERMINAL}"
	@echo "ZSH - ${ZSH}"
	@echo "PYENV_SHELL - ${PYENV_SHELL}"

.PHONY: install
install: ## Install brew, zsh, etc - UNDER CONSTRUCTION
	@echo "Not ready yet"
	# install homebrew as package manager
	# install iterm2 as terminal
	# install zsh as shell
