##################
#####Neofetch#####
##################
neofetch

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
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

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
	zplug "zsh-users/zsh-autosuggestions"
	zplug "zsh-users/zsh-history-substring-search"
	zplug "junegunn/fzf"

	zplug "romkatv/powerlevel10k", as:theme

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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GVM
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##################
######Aliases#####
##################

alias vi="nvim"
alias ls="exa"
alias la="exa -a"
alias ll="exa -l"
alias lla="exa -al"
alias tree="exa -T --icons"
alias du="ncdu"
alias top="htop"
alias grep="rg"
alias cat="bat"
alias podman="sudo podman"

##################
#####Key Bind#####
##################
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# zsh-history-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
