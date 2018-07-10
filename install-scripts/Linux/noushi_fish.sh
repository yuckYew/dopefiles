sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish
sudo echo "/usr/local/bin/fish" >> /etc/shells
sudo chsh -s /usr/bin/fish
