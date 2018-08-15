# ===
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
# ===
ln -sf ~/dopefiles/.vimrc ~/.vimrc
mkdir ~/.config/nvim
ln -sf ~/dopefiles/.vimrc ~/.config/nvim/init.vim
pip install neovim
ln -sf ~/dopefiles/config.fish ~/.config/fish/config.fish
ln -sf ~/dopefiles/.tmux.conf ~/.tmux.conf
