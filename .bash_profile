#might need to sourch zshrc
alias bashrefresh="source ~/.bash_profile"

#git commands
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias grc="git for-each-ref --sort=-committerdate --count=12 --format='%(refname:short)' refs/heads/"
alias adog='git log --all --decorate --oneline --graph'
alias gconflict='vim +Conflicted'

#open bash
alias bashprofile='cd ~; vim .bash_profile'
