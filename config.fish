status --is-interactive; and source (pyenv virtualenv-init -|psub)

## For Bob the Fish Theme
set -g theme_display_virtualenv yes

## For GOPATH
set -x GOPATH $HOME/Scrapyard/Projects/go/

set -x PATH $HOME/.pyenv/bin $PATH
. (pyenv init - | psub)
