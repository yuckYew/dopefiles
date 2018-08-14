# ===
# Install regular packages
# ===
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install fish
echo -e "\n/usr/local/bin/fish\n" >> /etc/shells
chsh -s `which fish`
