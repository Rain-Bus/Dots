##################
#####Neofetch#####
##################
fastfetch

######################
#####Zshrc Extend#####
######################
[[ -s "$HOME/.zshrcext" ]] source "$HOME/.zshrcext"

####################
#####ZPlug Init#####
####################
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

###############
######Envs#####
###############
export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"

# ZSH History
#export HISTFILE="$HOME/.zsh_history"
#export HISTSIZE=10000
#export SAVEHIST=10000

# PNPM
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

####################
#####Global Var#####
####################
# ZSH History
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
# Upper Lower Letter Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#######################
#####ZPlug Plugins#####
#######################
if [[ -f ~/.zplug/init.zsh ]] {
	autoload colors && colors
	zplug "plugins/git", from:oh-my-zsh
	zplug "plugins/sudo", from:oh-my-zsh
	zplug "plugins/z", from:oh-my-zsh
	zplug "plugins/aliases", from:oh-my-zsh
	zplug "plugins/extract", from:oh-my-zsh
	zplug "plugins/colored-man-pages", from:oh-my-zsh

	zplug "zsh-users/zsh-syntax-highlighting"
#	zplug "zsh-users/zsh-autosuggestions"
#	zplug "zsh-users/zsh-history-substring-search"
	zplug "junegunn/fzf"

	#zplug "romkatv/powerlevel10k", as:theme

}
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi
zplug load

######################
#####Prog's Init######
######################

# Sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GVM
export GVM_DIR="$HOME/.gvm"
[[ -s "$GVM_DIR/scripts/gvm" ]] && source "$GVM_DIR/scripts/gvm"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || [[ -s "$PYENV_ROOT/bin/pyenv" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null && eval "$(pyenv init -)"

# ASDF
export ASDF_DIR="$HOME/.asdf"
[[ -s "$ASDF_DIR/asdf.sh" ]] && . "$ASDF_DIR/asdf.sh"
[[ -s ${ASDF_DIR}/completions ]] && fpath=(${ASDF_DIR}/completions $fpath) && autoload -Uz compinit && compinit

# Rustup
[[ -s "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# Powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Starship
eval "$(starship init zsh)"

# Atuin
eval "$(atuin init zsh)"

##################
######Aliases#####
##################

alias vi="nvim"
alias ls="eza"
alias la="eza -a"
alias ll="eza -l"
alias lla="eza -al"
alias tree="eza -T --icons"
alias du="ncdu"
alias top="htop"
# alias grep="rg"
# alias cat="bat"
alias podman="sudo podman"
alias podman-compose="sudo podman-compose"
alias za="zellij a"
alias zn="zellij -s"
alias zl="zellij ls"
alias tn="tmux new -s"
alias ta="tmux at -t"
[[ -n "$PORXY_SERVER" ]] && alias proxyall="all_proxy=$PROXY_SERVER"

##################
#####Key Bind#####
##################
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

# zsh-history-search
#bindkey "^[[A" history-substring-search-up
#bindkey "^[[B" history-substring-search-down
