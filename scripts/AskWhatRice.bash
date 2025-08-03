# Ask what Rice
echo "Select rice:"
echo "1) Minimalistic"
read -p "> " RICE
case $RICE in
    1)
        RICE_NAME="Minimalistic"
        ;;
    *)
        echo "NUHUH"
        rm -rf ~/.config/hypr/temp
		exit 1
        ;;
esac


# Find what os
if grep -qi "NixOs" /etc/os-release; then
    OS="NixOs"
elif grep -qi "Arch" /etc/os-release; then
    OS="Arch"
else
	echo "NUHUH"
    rm -rf ~/.config/hypr/temp
	exit 1
fi


# Do scripts
rm -rf ~/.config/hypr/temp/
curl -Ls "https://raw.githubusercontent.com/Sqydev/Rices/refs/heads/main/scripts/${RICE_NAME}/${OS}.bash" -o ~/.config/hypr/temp/Instalation.bash

bash ~/.config/hypr/temp/Instalation.bash
