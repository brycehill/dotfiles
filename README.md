# Ohmyzsh
```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

# Homebrew
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ccat
brew install the_silver_searcher
```

# Neovim
```sh
brew install neovim/neovim/neovim
brew install python3
pip3 install neovim
#  Install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# tmux
```sh
brew install tmux
```
Install tpm for tmux plugins

```sh
# Karabiner
https://pqrs.org/osx/karabiner/
https://pqrs.org/osx/karabiner/seil.html.en
```


# Atom
```sh
open https://github.com/atom/atom/releases/tag/v1.5.4
```

# Node / nvm / npm
```sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
# nvm install 5.0
# nvm use 5.0
# or ?
open https://nodejs.org/en/download/
```

# Link up stuff
```sh
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/nvimrc .nvimrc
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/tmux.conf .tmux.conf
ln -s dotfiles/gitconfig .gitconfig
```
,
# Fonts
```sh
brew tap caskroom/fonts
brew cask install font-hasklug font-hasklig-nerd-font font-hasklig-nerd-font-mono
```
Update font in iTerm, 14pt Hasklug Nerd Font Complete Mono
Add like 1% vertical spacing
