# Path to your oh-my-zsh installation.
export ZSH=/Users/bryce.hill/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git colored-man-pages zsh-syntax-highlighting)

####################
#
# User configuration
#
####################
export PATH="/Users/bryce.hill/.cabal/bin:/Applications/ghc-7.8.3.app/Contents/bin:/Users/bryce.hill/.sdkman/groovy/current/bin:/Users/bryce.hill/.sdkman/grails/current/bin:/usr/local/bin:/usr/local/mongodb:/usr/local/mongodb/bin:/usr/local/mysql/bin:/usr/local/php5/bin:/usr/local/git/bin/git:/usr/local/php5/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/mongodb/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/local/mysql/bin:/Users/bryce.hill/Library/Haskell/bin:/usr/local/installs/maven/current/bin:/Users/bryce.hill/bin:/Users/bryce.hill/.rbenv"
# export MANPATH="/usr/local/man:$MANPATH"
export FZF_DEFAULT_COMMAND='ag -U -g ""'
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias neovim="nvim ~/.nvimrc"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# lynx!
alias lynx='/Applications/Lynxlet.app/Contents/Resources/lynx/bin/lynx'

# Java
alias j6='export JAVA_HOME=$JAVA6_HOME'
alias j7='export JAVA_HOME=$JAVA7_HOME'

// work stuff
alias cas="cd ~/projects/cas && j6 && mvn tomcat:run-war"
alias mapi="cd ~/projects/marketplace-api && gvm use grails 2.3.11 && grails run-app -https"
alias mpps="cd ~/projects/marketplace-polymer && gulp serve"
alias mppd="cd ~/projects/marketplace-polymer && gulp dev --watch"
alias standup="open 'https://infusionsoft.webex.com/mw3000/mywebex/default.do?service=1&siteurl=infusionsoft&nomenu=true&main_url=%2Fmc3000%2Fe.do%3Fsiteurl%3Dinfusionsoft%26AT%3DMI%26EventID%3D411996312%26UID%3D516466992%26Host%3DQUhTSwAAAALwmP7QWC0tRxt4wSor2ftNxcg6lOU6I9KN4QDjP7ZnZudZo-_IBuhWBZhl2XO6K0iA8uLxPFntzxPlDrsfpkHF0%26FrameSet%3D2%26MTID%3Dm3c80ab626d1e13110992b0e0372dc645'"

export NVM_DIR="/Users/bryce.hill/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init -)"

