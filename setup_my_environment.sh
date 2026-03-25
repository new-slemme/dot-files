sudo apt install fish neofetch exa ncdu bat
curl -sS https://starship.rs/install.sh | sh
starship init fish | source
echo "starship init fish | source" > .config/fish/config.fish
fish_greeting
