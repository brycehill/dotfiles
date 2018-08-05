# Ohmyzsh
```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

# Homebrew
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

# Brewfile
```sh
# clone this directory and then install brewfile
git clone git@github.com:brycehill/dotfiles.git
cd dotfiles
brew file install
```

# Link up stuff
```sh
ln -Fs dotfiles/zshrc .zshrc
ln -Fs dotfiles/nvimrc .nvimrc
ln -Fs dotfiles/vimrc .vimrc
ln -Fs dotfiles/tmux.conf .tmux.conf
ln -Fs dotfiles/gitconfig .gitconfig
ln -Fs dotfiles/Brewfile .config/brewfile/Brewfile

cp dotfiles/aliases.zsh $ZSH_CUSTOM/aliases.zsh
source ~/.zshrc
```

# Download and setup theme
```sh
curl https://raw.githubusercontent.com/therealklanni/purity/master/purity.zsh --output purity.zsh
mkdir ~/.zfunctions
cp purity.zsh ~/.zfunctions/prompt_purity_setup
```

# Neovim
```sh
pip install neovim
#  Install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# tmux
```sh
# Install tpm for tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s dotfiles/tmuxline ~/.tmux/tmuxline
```


# Node / nvm / npm
```sh
curl -o- https://raw.githubuserconte
```


# Mac Stuff
```sh
# Remove Dock Animation
defaults write com.apple.dock autohide-time-modifier -float 0;killall Dock
defaults write com.apple.dock autohide-delay -float 0; killall Dock
defaults write com.apple.dock workspaces-swoosh-animation-off -bool YES
defaults write com.apple.finder AppleShowAllFiles -bool YES
 New Screenshots folder
mkdir ~/Documents/Screenshots
defaults write com.apple.screencapture location ~/Documents/Screenshots
```

Update font in iTerm, 14pt + Hasklug Nerd Font Complete Mono
Add like 1% vertical spacing
