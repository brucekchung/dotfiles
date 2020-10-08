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

.PHONY: symlink
symlink: ## Symlinks vimrc, zshrc, gitignore_global
	ln -snf "$(PWD)/.vimrc" "$(HOME)/.vimrc"
	ln -snf "$(PWD)/.zshrc" "$(HOME)/.zshrc"
	ln -snf "$(PWD)/.gitignore_global" "$(HOME)/.gitignore_global"
	git config --global core.excludesfile ~/.gitignore_global

# TODO: set defaults elsewhere
.PHONY: set-macros
set-macros: ## Set system defaults
	defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
	defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)

.PHONY: list-env
list-env: ## List applicable environmental variables
	@echo "HOME - ${HOME}"
	@echo "PWD - ${PWD}"
	@echo "LC_TERMINAL - ${LC_TERMINAL}"
	@echo "ZSH - ${ZSH}"
	@echo "SHELL - ${SHELL}"
	@echo "...ensure TERMINAL is iterm2, ZSH points to ohmyzsh, and SHELL is zsh..."

.PHONY: install
install: ## Install Brew and terminal setup (iTerm2, ZSH, oh-my-zsh)
	@echo "Installing Brew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@echo "Installing iTerm2..."
	brew cask install iterm2
	@echo "Installing ZSH..."
	brew install zsh
	@echo "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	@echo "Installation complete!"	
