#might need to sourch zsh rc
alias bashrefresh="source ~/.bash_profile"

#git commands
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias grc="git for-each-ref --sort=-committerdate --count=12 --format='%(refname:short)' refs/heads/"
alias adog='git log --all --decorate --oneline --graph'
alias gconflict='vim +Conflicted'

#open bash
alias bashprofile='cd ~; vim .bash_profile'

#navigation
alias ltflask='cd /var/www/ltflask'

#source virtual env
alias ltenv='source ~/LandTitle/environments/ltenv/bin/activate && source env.sh'

#db migrations
alias downgrade='python3 alembic_bulk_downgrade.py stage'
alias upgrade='alembic upgrade heads'

#point ctags to homebrew version
alias ctags="`brew --prefix`/bin/ctags"

#declare path to postgresql 12.2
export PATH=/usr/local/Cellar/postgresql/12.2/bin:$PATH
