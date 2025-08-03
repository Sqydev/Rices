# Ask what Rice
echo "Select rice:"
echo "1) Minimalistic"
read -P "> " RICE

switch $RICE
    case 1
        set RICE_NAME "Minimalistic"
    case '*'
        exit 1
end

# Find what OS
if grep -qi "NixOs" /etc/os-release
    set OS "NixOs"
else if grep -qi "Arch" /etc/os-release
    set OS "Arch"
else
	exit 1
end

# Do scripts
set SCRIPT_URL "https://raw.githubusercontent.com/Sqydev/Rices/refs/heads/main/scripts/$RICE_NAME/Fish/$OS.fish"
set SCRIPT_PATH ~/.config/hypr/temp/Instalation.fish

curl -Ls $SCRIPT_URL -o $SCRIPT_PATH
fish $SCRIPT_PATH

