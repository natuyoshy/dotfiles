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
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# if git checkout .; then
#   printf "ok? (y/N):"
#   if read -q; then
#     echo; git checkout .
#   fi
# fi
# Then, source plugins and add commands to $PATH
zplug load
autoload -U compinit
compinit
setopt hist_ignore_dups
setopt share_history
export SSH_KEY_PATH="~/.ssh/rsa_id"
export GOPATH=$HOME/dev
export PATH=$PATH:$GOPATH/bin
export EDITOR=vim
eval "$(direnv hook zsh)"

if which pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

if which rbenv > /dev/null; then
eval "$(rbenv init - zsh)"
export PATH="$HOME/.rbenv/bin:$PATH"
fi

export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="$HOME/bin:$PATH"

alias ll='ls -laG'
alias l='ls -G'
alias c='cd'
alias p='pwd'
alias v='vim'
alias relogin='exec $SHELL -l'
alias dd="docker ps -a"
alias t="tmux"
alias swp="find . -name '.*.sw*'"
alias swprm="find . -name '.*.sw*'|xargs rm"
alias gbm="git branch --merged"
alias gbmrm="git branch --merged|egrep -v '\*|develop|master'|xargs git branch -d"

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

export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=100000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
