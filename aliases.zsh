# For a full list of active aliases, run `alias`.
alias zc="nvim ~/.zshrc"
alias omz="nvim ~/.oh-my-zsh"
alias v="nvim"
alias vim="/usr/local/bin/vim" # Overwrite vim without renaming /usr/bin/vim
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
unsetopt correct_all

# Elm
alias er="elm-repl"

# For CV Project
alias yd="yarn dev:inline"
alias yda="yarn dev:all"
alias ydp="yarn dev:portfolio"
alias ys="yarn storybook"

# Copy the current branch name
alias gbc='git branch | grep \* | cut -f2 -d " " | pbcopy'
alias ctags="`brew --prefix`/bin/ctags"

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


