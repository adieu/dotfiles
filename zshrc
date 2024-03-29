# oh-my-zsh
if [ -e "$HOME/.oh-my-zsh" ]; then
  ZSH=$HOME/.oh-my-zsh
  ZSH_THEME="robbyrussell"
  plugins=(git brew django pip python)
  source $ZSH/oh-my-zsh.sh
fi

# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# virtualenvwrapper
if [ -e "$HOME/.virtualenvwrapper" ]; then
  source "$HOME/.virtualenvwrapper"
fi

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

if [[ $(uname) == Darwin ]]; then
	export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
	export ARCHFLAGS="-arch i386 -arch x86_64"
	export LC_CTYPE=en_US.UTF-8
	export LC_ALL=en_US.UTF-8
fi
