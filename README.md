## Setup Instructions

Start using the native `terminal` application

Xcode is the suite of developer tools not included by default

Download xcode from app store
Download xcode cli tools
```xcode-select --install
```

Homebrew is the "missing package manager" for MacOS
```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Clone repo into $HOME/Projects and run installation for terminal setup
or manually run:
```	brew install iterm2
	brew install zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Can list commands by running `make help`
Update and symlink your setup from the menu


#### Others

ssh key for github
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

download IBM monoplex font
https://fonts.google.com/specimen/IBM+Plex+Mono
open ‘Font Book’ application, add font


Dotfiles under construction!
GOAL:
- end to end setup of programming environment
- all done through Makefile commands

TODO:
- add zsh plugins! fzf - file fuzzy finder for terminal

- brew script for applications
- fonts? IBM monoplex?
- solarized setup??
- make README niceeee


Issues!!!
- Xterm install... so I can git init etc
- remap capslock to ctrl...
- IBM Plex Mono, then click to install
- install pathogen
