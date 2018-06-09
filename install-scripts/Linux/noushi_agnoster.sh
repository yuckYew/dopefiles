apt install git-core zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo apt install fonts-powerline
sed -i 's/robbyrussel/agnoster/g' ~/.zshrc
source ~/.zshrc
chsh -s $(which zsh)
echo "Re-login to update shell to Zsh"

# Add my alias
echo "alias hosei='sudo openconnect vpn.hosei.ac.jp'" >> ~/.zshrc
