export ZSH=/Users/k__bayashi/.oh-my-zsh
ZSH_THEME="agnoster"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

export SSH_KEY_PATH="~/.ssh/rsa_id"


alias ll='ls -la'
alias l='ls'
alias c='cd'
alias p='pwd'
alias v='vim'
alias relogin='exec $SHELL -l'
alias dd="docker ps -a"
#git
alias gs='git status'
alias ga='git add'
alias gl='git log --oneline'
alias gp='git push origin'
alias gc='git commit -m'
alias gst='git stash'
alias gp='git stash pop'
alias gr='git rebase -i'
alias b='branch'

export PATH=/usr/local/bin:$PATH
eval "$(rbenv init -)"
export PKG_CONFIG_PATH=/opt/ImageMagick/lib/pkgconfig
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PGDATA=/usr/local/var/postgres
alias updatedb='sudo /usr/libexec/locate.updatedb'
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
eval "$(direnv hook zsh)"
export EDITOR=vim
export PATH=$PATH:/Users/k__bayashi/Library/Android/sdk/platform-tools
