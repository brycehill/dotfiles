# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="purity"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"


# Don't auto check for zsh updates. Check every 30 days.
DISABLE_UPDATE_PROMPT="true"
UPDATE_ZSH_DAYS=30

plugins=(git colored-man-pages osx)

# Setup BrewFile - Do this on new systems? Disable because slow.
# if [ -f $(brew --prefix)/etc/brew-wrap ];then
#   source $(brew --prefix)/etc/brew-wrap
# fi

####################
#
# User configuration
#
####################

export PATH="$HOME/.cabal/bin:$HOME/.local/bin:/Applications/ghc-7.8.3.app/Contents/bin"
export PATH="$PATH:/usr/local/mysql/bin:/usr/local/git/bin/git:/usr/local/bin:/usr/bin"
export PATH="$PATH:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/bin:/bin"
export PATH="$PATH:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/mysql/bin"
export PATH="$PATH:/usr/local/mysql/bin:~/Library/Haskell/bin:"
export PATH="$PATH:~/.local/bin"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# export FZF_DEFAULT_COMMAND='rg --files --ignore-vcs --ignore-global'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH/oh-my-zsh.sh

fpath=( "~/.oh-my-zsh/themes/pure/" $fpath )

alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf'
alias vifi='nvim $(fzfi)'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Auto load node version when a `.nvmrc` file is found
autoload -U add-zsh-hook

load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc



# Added by n-install (see http://git.io/n-install-repo).
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
