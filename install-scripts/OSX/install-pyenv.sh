# ===
# Snippets for pyenv on fish shell
# ==

git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'set -x PATH $HOME/.pyenv/bin $PATH' >> ~/dopefiles/config.fish
echo '. (pyenv init - | psub)' >> ~/dopefiles/config.fish
