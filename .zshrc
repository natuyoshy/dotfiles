export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
zplug "b4b4r07/emoji-cli"
zplug "zsh-users/zsh-completions"
zplug "mrowa44/emojify", as:command
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load

export SSH_KEY_PATH="~/.ssh/rsa_id"
export GOPATH=$HOME/dev
export PATH=$PATH:$GOPATH/bin
export EDITOR=vim

alias ll='ls -laG'
alias l='ls -G'
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
alias gstp='git stash pop'
alias gr='git rebase -i'
alias gb='git branch'
alias gd='git diff'
alias gfc='git commit --allow-empty -m'

function history-fzf() {
    local tac=${commands[tac]:-"tail -r"}
    BUFFER=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | sed 's/ *[0-9]* *//' | eval $tac | awk '!a[$0]++' | fzf +s)
    CURSOR=$#BUFFER
    zle clear-screen
}

zle -N history-fzf
bindkey '^r' history-fzf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
