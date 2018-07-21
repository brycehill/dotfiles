# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="purity"

# autoload -U promptinit && promptinit
# prompt purity

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git colored-man-pages zsh-syntax-highlighting yarn osx brew)

# Setup BrewFile
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

####################
#
# User configuration
#
####################
#
export PATH="$HOME/.cabal/bin:$HOME/.local/bin:/Applications/ghc-7.8.3.app/Contents/bin"
export PATH="$PATH:/usr/local/mysql/bin:/usr/local/git/bin/git:/usr/local/bin:/usr/bin"
export PATH="$PATH:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/bin:/bin"
export PATH="$PATH:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/mysql/bin"
export PATH="$PATH:/usr/local/mysql/bin:~/Library/Haskell/bin:~/.rbenv"
export PATH="$PATH:~/.local/bin:$(yarn global bin):~/.config/yarn/global/node_modules:~/.local/bin"
export PATH="$HOME/.yarn/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"
export FZF_DEFAULT_COMMAND='ag --hidden  --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

fpath=( "$HOME/.zfunctions" $fpath )

eval "$(rbenv init -)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_dIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Export `z`
. '/usr/local/etc/profile.d/z.sh'
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
