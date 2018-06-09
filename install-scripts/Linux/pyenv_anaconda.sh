# Install pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc

# Install Anaconda
pyenv install anaconda3-5.1.0
pyenv rehash
pyenv global anaconda3-5.1.0
echo 'export PATH="$PYENV_ROOT/versions/anaconda3-5.1.0/bin/:$PATH"' >> ~/.zshrc
source ~/.zshrc
conda update conda
