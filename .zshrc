# export TERM="xterm-256color"
export TERM="screen-256color"
# [[ -n $TMUX ]] && export TERM="screen-256color"

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH

export HISTFILE=~/.config/zsh/.zsh_history

export NODE_REPL_HISTORY="${HOME}/.config/node_repl_history"
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export LESSHISTFILE=-

ZSH_THEME="robbyrussell"
plugins=(
  git vagrant sudo brew
  docker docker-compose 
  macos tmux python pip
  node npm nvm yarn z 
)
source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/sbin:$PATH"

create_dir_and_cd(){
  mkdir -p $1 && cd $1
}

mdview() {
  pandoc "$1" | w3m -T text/html
}

alias py="python3.12"
alias python="python3.9"
alias lsl="exa -lg --git --icons --header --group-directories-first"
alias dir="exa -lag --git --icons --header --group-directories-first"
alias lti="exa -lag --git --icons --header --git-ignore --ignore-glob='.git' --group-directories-first --tree"
alias lt="exa -lag --git --icons --header --group-directories-first --tree"
alias le="exa -a --icons --group-directories-first"
alias rf="rm -rf"
alias cls="clear"
alias md="create_dir_and_cd"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

. "$HOME/.cargo/env"
eval "$(starship init zsh)"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

