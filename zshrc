# If you come from bash you might have to change your $PATH.
export PATH=$HOME/local/bin:/usr/local/bin:$PATH

# zsh auto-completion
autoload -Uz compinit && compinit 


# Python virtualenv

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
# use gpip if you really need to install anything in the global python
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi


# disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Personal aliases
alias zshconfig="vim ~/.zshrc"
alias dcp="docker-compose"
alias l="exa -l"
alias la="exa -al"
alias ll="exa -alh"
alias gst='git status'
alias gc='git commit'

# add mmv command
# examples:
#   mmv *.dat *.dat_old
#   mmv foo.* bar.*
#   mmv **/*2008.mp3 **/*2009.mp3
autoload -U zmv
alias mmv='noglob zmv -W'


# keychain
eval `keychain --eval --agents ssh --inherit any id_dsa id_ed25519`

fpath=(/usr/local/share/zsh-completions $fpath)

export GOOGLE_APPLICATION_CREDENTIALS="/users/kepper/.gcloud/PrintAPI-Shopify-318ee4dd1843.json"

# add mmv command
# examples:
#   mmv *.dat *.dat_old
#   mmv foo.* bar.*
#   mmv **/*2008.mp3 **/*2009.mp3
autoload -U zmv
alias mmv='noglob zmv -W'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# set default user for prompt
DEFAULT_USER="kepper"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# store gitBranch in an iterm2 user_var
iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

# Kubernetes
alias k='kubectl'

if [ $commands[kubectl] ]; then
   source <(kubectl completion zsh)
   source ~/.kubectl_fzf.plugin.zsh
fi

# fzf - command line fuzzy finder https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export LULU_USER=ckepper
cdpath=($HOME/repos/upp/ $HOME/repos/upp/platform/services $HOME/repos/upp/p    latform $HOME/repos/upp/tools $HOME/repos)

# direnv
eval "$(direnv hook zsh)"
# starship
eval "$(starship init zsh)"
# zoxide
eval "$(zoxide init zsh)"
# cdpath
setopt auto_cd
cdpath=($HOME $HOME/repos $HOME/repos/upp $HOME/repos/upp/platform $HOME/repos/upp/platform/services $HOME/repos/pp)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kepper/repos/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kepper/repos/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kepper/repos/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kepper/repos/google-cloud-sdk/completion.zsh.inc'; fi
