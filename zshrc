#=== SSH-agent
eval "$(ssh-agent -s)"
# TODO: automatically add keys?

#=== dir-env
eval "$(direnv hook zsh)"

#=== Aliases
#alias get_tun0_ip="ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
alias clip="xclip -selection clipboard"
alias gp="sgpt"
alias gprl="sgpt --repl temp"
alias gpsh="sgpt --shell"
alias vi="nvim"
alias c="clear"
alias ll="ls -l"
alias la="ls -A"
alias l="ls -CF"
alias zsreload="source ~/.zshrc"

#=== PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:/usr/local/go/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin


#=== Prompt
PS1="[λ]- [%1~]-> "

#=== Environment variables
export EDITOR="nvim"
export TMUX_CONF="~/.config/tmux.conf"
export XDG_CONFIG_HOME=$HOME/.config

#=== Plugins
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#=== The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/eknovitz/.zshrc'

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

# Shell-GPT integration ZSH v0.2
_sgpt_zsh() {
if [[ -n "$BUFFER" ]]; then
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd" --no-interaction)
    zle end-of-line
fi
}
zle -N _sgpt_zsh
bindkey ^l _sgpt_zsh
# Shell-GPT integration ZSH v0.2
