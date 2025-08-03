mkdir -p ~/.config/hypr/temp

curl -L "https://raw.githubusercontent.com/Sqydev/Rices/refs/heads/main/scripts/AskWhatRice.bash" -o ~/.config/hypr/temp/AskWhatRice.bash

bash ~/.config/hypr/temp/AskWhatRice.bash || echo "You need bash"
