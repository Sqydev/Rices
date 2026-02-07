#!/usr/bin/env bash

DISTRIB_ID=$(cat /etc/*-release | grep '^DISTRIB_ID=' | cut -d= -f2)

cd "$HOME/.config" || exit 1

if [ -d "./Rices" ]; then
    echo -n "Directory ~/.config/Rices WILL get deleted. Do you want to proceed?[y/n]: "
    read ans
    if [[ $ans != "y" && $ans != "Y" ]]; then
        echo "ok:)"
        exit
    fi
fi

rm -rf ./Rices

git clone https://github.com/Sqydev/Rices.git

cd ./Rices/

mapfile -t rices < <(printf "%s\n" ./rices/* | xargs -n1 basename)

for i in "${!rices[@]}"; do
    printf "%d. %s\n" $((i+1)) "${rices[$i]}"
done

echo -n "What rice do you want(type number): "

read choice

if (( choice < 1 || choice > ${#rices[@]} )); then
	echo "BAD choice :("
	exit
fi

rice="${rices[$((choice-1))]}"

echo -e "\nGoing further WILL delete directories listed bellow:"

for dir in ./rices/"$rice"/*/; do
    [ -d "$dir" ] && echo "  $(basename "$dir")"
done

echo -n "DO YOU WANT TO CONTINUE?[y/n]: "
read warn_choice

if [ "$warn_choice" != "y" ] && [ "$warn_choice" != "Y" ]; then
	echo "ok :)"
	exit
fi

for dir in ./rices/"$rice"/*/; do
    target="$HOME/.config/$(basename "$dir")"
    if [ -d "$target" ] || [ -L "$target" ]; then
        rm -rf "$target"
        echo "Deleted $target"
    fi
done

for dir in ./rices/"$rice"/*/; do
    target="$HOME/.config/$(basename "$dir")"
    ln -s "$PWD/$dir" "$target"
    echo "Linked $(basename "$dir") -> $target"
done

# HERE DO INSTALLING SOFTWARE PART
# And for unsported os's ask the user if they want the script to install binaries for them using github(you know git releases mv things)
