#!/usr/bin/env bash

set -Eeuo pipefail
trap 'echo; echo "Script failed at line $LINENO"; exit 1' ERR

if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRIB_ID=$ID
elif [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    DISTRIB_ID=$DISTRIB_ID
fi

cd "$HOME/.config"

if [ -d "./Rices" ]; then
    echo -n "Directory ~/.config/Rices WILL get deleted. Do you want to proceed?[y/n]: "
    read ans
    if [[ $ans != "y" && $ans != "Y" ]]; then
        echo "ok:)"
        exit
    fi
fi

rm -rf ./Rices

git clone https://github.com/Sqydev/Rices.git || exit 1

cd ./Rices/ || exit 1

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

echo -e "\nChecking required packages..."

required_pkgs=(
    alacritty
    rofi
	fish
	fastfetch
	hyprland
	oh-my-posh
	waybar
	waypaper
	hyprpaper
	hyprshoot
	sddm
)

missing_pkgs=()

for pkg in "${required_pkgs[@]}"; do
    if ! command -v "$pkg" >/dev/null 2>&1; then
        missing_pkgs+=("$pkg")
    fi
done

if [ ${#missing_pkgs[@]} -eq 0 ]; then
    echo "All required packages are installed."
    exit 0
fi

echo "Missing packages:"
printf "  %s\n" "${missing_pkgs[@]}"

case "$ID" in
    arch|manjaro)
        echo "Installing using pacman..."
        sudo pacman -S --needed --noconfirm "${missing_pkgs[@]}"
        ;;
    ubuntu|debian|linuxmint|pop)
        echo "Installing using apt..."
        sudo apt update
        sudo apt install -y "${missing_pkgs[@]}"
        ;;
    fedora)
        echo "Installing using dnf..."
        sudo dnf install -y "${missing_pkgs[@]}"
        ;;
    opensuse*|suse)
        echo "Installing using zypper..."
        sudo zypper install -y "${missing_pkgs[@]}"
        ;;
    *)
        echo
        echo "Unsupported distribution: $ID"
        echo "Please install the following packages manually:"
        printf "  %s\n" "${missing_pkgs[@]}"
        echo
        echo "After installing them, run this script again."
        exit 1
        ;;
esac

echo "Package installation finished."
