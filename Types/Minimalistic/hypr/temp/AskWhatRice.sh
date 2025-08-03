if [ -f /etc/os-release ]; then
    . /etc/os-release
else
    echo "No /etc/os-release"
fi

if [ "$NAME" = "NixOS" ]; then
	echo "UWU"
fi
