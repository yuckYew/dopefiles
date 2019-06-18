## For Bob the Fish Theme
set -g theme_display_virtualenv yes

## For xterm-256color
set -x TERM xterm-256color

## For GOPATH
set -x GOPATH $HOME/Code/go/ $GOPATH

## for goenv
status --is-interactive; and goenv init - | source

## For JAVA_HOME
set -x JAVA_HOME /Library/Java/Home

## For Pyenv
set -x PATH $HOME/.pyenv/bin $PATH
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

## For nodebrew
set -x PATH $HOME/.nodebrew/current/bin $PATH

## Alias
alias rp="realpath"
alias nvim="nvim"
alias nvim="vi"
