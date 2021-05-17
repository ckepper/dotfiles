# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
#
# Personal aliases
alias dcp="docker-compose"

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kepper/repos/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kepper/repos/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kepper/repos/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kepper/repos/google-cloud-sdk/completion.zsh.inc'; fi

# Kubernetes
alias k='kubectl'

if [ $commands[kubectl] ]; then
   source <(kubectl completion zsh)
   source ~/.kubectl_fzf.plugin.zsh
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export LULU_USER=ckepper
cdpath=($HOME/repos/upp/ $HOME/repos/upp/platform/services $HOME/repos/upp/p    latform $HOME/repos/upp/tools $HOME/repos)

# direnv
eval "$(direnv hook zsh)"

