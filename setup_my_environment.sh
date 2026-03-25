#!/usr/bin/fish

cp -rv ~/dot-files ~/.config/

cp ~/.config/fish/functions/fish_greeting.fish.ssh ~/.config/fish/functions/fish_greeting.fish
cp ~/.config/neofetch/config_base.conf ~/.config/neofetch/config.conf

sudo apt install -y neofetch exa ncdu bat zoxide fzf fd-find thefuck

#python3-dev python3-pip python3-setuptools playerctl

curl -LO https://github.com/ClementTsang/bottom/releases/download/0.12.3/bottom_0.12.3-1_amd64.deb
sudo dpkg -i bottom_0.12.3-1_amd64.deb

abbr -a fd fdfind
thefuck --alias >> ~/.config/fish/config.fish
echo "zoxide init fish | source" > ~/.config/fish/config.fish

curl -sS https://starship.rs/install.sh | sh
echo "starship init fish | source" > ~/.config/fish/config.fish

source ~/.config/fish/config.fish

fish_greeting
starship init fish | source
zoxide init fish | source