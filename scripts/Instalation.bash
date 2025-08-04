# Ask what Rice
echo "Select rice:"
echo "1) Minimalistic"
read -p "> " RICE
case $RICE in
    1)
        RICE_NAME="Minimalistic"
        ;;
    *)
		exit 1
        ;;
esac


# Find what os
if grep -qi "NixOs" /etc/os-release; then
    OS="NixOs"
elif grep -qi "Arch" /etc/os-release; then
    OS="Arch"
else
	exit 1
fi


# Do scripts
fish -c "$(curl -Ls "https://raw.githubusercontent.com/Sqydev/Rices/refs/heads/main/scripts/${RICE_NAME}/Bash/${OS}.bash)"
