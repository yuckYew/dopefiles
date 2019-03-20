## For Bob the Fish Theme
set -g theme_display_virtualenv yes

## For GOPATH
set -x GOPATH $HOME/go/

## For pyenv
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)

## For rbenv
set -x PATH $HOME/.rbenv/bin $PATH
. (rbenv init - | psub)

## for nodebrew
set -x PATH $HOME/.nodebrew/current/bin $PATH

## Alias
alias rp="realpath"
alias autopep="autopep8 --in-place --aggressive --aggressive"
