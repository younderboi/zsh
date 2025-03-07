#=== SSH-agent
eval $(ssh-agent)

#=== dir-env
eval "$(direnv hook zsh)"

#=== Aliases
alias get_tun0_ip="ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
alias clip="xclip -selection clipboard"
alias vi="nvim"
alias c="clear"
alias ll="ls -l"
alias la="ls -A"
alias l="ls -CF"
alias zsreload="source ~/.zshrc"
alias clear-hashcat="rm ~/.local/share/hashcat/hashcat.potfile"

#=== PATH
export PATH=$HOME/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=$HOME/.local/bin:/usr/local/go/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$HOME/utils:$PATH
export PATH=/arsenal/bin:$PATH
export PATH=/arsenal/sources/john/run:$PATH

#=== Prompt
setopt prompt_subst

PS1="╭─[λ]-[%~]-[\${RHOST}]
╰─> "

#=== Environment variables
export EDITOR="nvim"
export TMUX_CONF="~/.config/tmux.conf"
export XDG_CONFIG_HOME=$HOME/.config

#=== Arsenal
alias ars=cd /arsenal/

#=== Plugins
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#=== The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/noctua/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
