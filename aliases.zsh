# For a full list of active aliases, run `alias`.
alias zc="nvim ~/.zshrc"
alias omz="nvim ~/.oh-my-zsh"
alias v="nvim"
alias vim="/usr/local/bin/vim" # Overwrite vim without renaming /usr/bin/vim
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
unsetopt correct_all

# Elm
alias er="elm-repl"

# NPM
alias ns='npm start'
alias dev='npm run dev'
alias nt='npm test'
alias nrc='npm run cy:run'
alias nro='npm run cy:open'
alias nrs='npm run storybook'

# yarn
alias yd='yarn dev'
alias yt='yarn test'
alias yrc='yarn cy:run'
alias yro='yarn cy:open'
alias yrs='yarn storybook'

# Copy the current branch name
alias gbc='git branch | grep \* | cut -f2 -d " " | pbcopy'
alias ctags="`brew --prefix`/bin/ctags"
# Most recent commits, compact
alias glr="glol -n 20"

# Only load nvm
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}


