echo "Select rice:"
echo "1) Minimalistic"
read -p "> " RICE

case $RICE in
    1)
        RICE_ID="1"
        ;;
    *)
        echo "NUHUH"
        exit 1
        ;;
esac

SHELL_NAME=$(basename "$SHELL")

# Find what os
if grep -qi "NixOs" /etc/os-release; then
    OS="NixOs"
elif grep -qi "Arch" /etc/os-release; then
    OS="Arch"
else
	echo "NUHUH"
    exit 1
fi

echo $OS
echo $RICE_ID
echo $SHELL_NAME
