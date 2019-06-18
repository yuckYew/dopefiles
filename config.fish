## For Bob the Fish Theme
set -g theme_display_virtualenv yes

## For xterm-256color
set -x TERM xterm-256color

## For GOPATH
<<<<<<< HEAD
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

## For rbenv
set -x PATH $HOME/.rbenv/bin $PATH
. (rbenv init - | psub)

## Alias
alias rp="realpath"
alias nvim="nvim"
alias nvim="vi"
alias autopep="autopep8 --in-place --aggressive --aggressive"
