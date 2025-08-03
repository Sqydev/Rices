mkdir -p ~/.config/hypr/temp

curl -Ls "https://raw.githubusercontent.com/Sqydev/Rices/refs/heads/main/scripts/AskWhatRice.bash" -o ~/.config/hypr/temp/AskWhatRice.bash

bash ~/.config/hypr/temp/AskWhatRice.bash || echo "If you don't have bash you need It"
