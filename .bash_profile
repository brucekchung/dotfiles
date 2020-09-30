alias bashrefresh="source ~/.bash_profile"

#git commands
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias grc="git for-each-ref --sort=-committerdate --count=12 --format='%(refname:short)' refs/heads/"
alias adog='git log --all --decorate --oneline --graph'
alias gconflict='vim +Conflicted'

#open bash
alias bashprofile='cd ~; vim .bash_profile'

#network
alias ip="curl -s ipinfo.io | jq -r '.ip'"
alias ipl="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"


# need to symlink and source?

# Add `~/bin` to the `$PATH`
# export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
# for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
# 	[ -r "$file" ] && [ -f "$file" ] && source "$file";
