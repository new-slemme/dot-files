#!/usr/bin/fish

cp -rv ./* ~/.config/

sudo apt install neofetch exa ncdu bat zoxide fzf fd-find playerctl python3-dev python3-pip python3-setuptools 

pip3 install thefuck --user

curl -LO https://github.com/ClementTsang/bottom/releases/latest/download/bottom_x86_64-unknown-linux-gnu.deb
sudo dpkg -i bottom_x86_64-unknown-linux-gnu.deb

abbr -a fd fdfind
thefuck --alias >> ~/.config/fish/config.fish
echo "zoxide init fish | source" > ~/.config/fish/config.fish

curl -sS https://starship.rs/install.sh | sh
echo "starship init fish | source" > ~/.config/fish/config.fish

source ~/.config/fish/config.fish

fish_greeting