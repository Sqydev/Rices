# Ask if user is sure
echo "Warning: This script WILL delete configs of those packages:"
echo "hyprland"
echo "rofi"
echo "waybar"
echo "alacritty"
echo "fastfetch"
echo
echo "1) I accept the consequences"
echo "2) I do NOT"
while true; do
	read -p "> " yn
    case $yn in
        [1]* ) break;;
        [2]* ) rm -rf ~/.config/hypr/temp & exit;;
        * ) rm -rf ~/.config/hypr/temp & exit;;
    esac
done


# Remove Rices if exists and install again
rm -rf ~/.config/Rices

cd ~/.config

git clone https://github.com/Sqydev/Rices.git

# Remove config of everything that will be used
rm -rf ~/.config/hypr
rm -rf ~/.config/rofi
rm -rf ~/.config/waybar
rm -rf ~/.config/alacritty
rm -rf ~/.config/fastfetch
rm -rf ~/.config/waypaper
rm -rf ~/.config/oh-my-posh

# Link new ones
ln -s ~/.config/Rices/Types/Minimalistic/hypr ~/.config/hypr
ln -s ~/.config/Rices/Types/Minimalistic/rofi ~/.config/rofi
ln -s ~/.config/Rices/Types/Minimalistic/waybar ~/.config/waybar
ln -s ~/.config/Rices/Types/Minimalistic/alacritty ~/.config/alacritty
ln -s ~/.config/Rices/Types/Minimalistic/fastfetch ~/.config/fastfetch
ln -s ~/.config/Rices/Types/Minimalistic/oh-my-posh ~/.config/oh-my-posh

# Print things to download
# Btw. Here's space so you can just do f.e. ":.,.+6s/ /pkgs." in vim
echo "List of pkgs to add to your nixos config:"
echo " hyprland"
echo " rofi"
echo " waybar"
echo " alacritty"
echo " fastfetch"
echo " waybar"
echo
echo "And if you want my ohmyposh+fastfetch configs are in ~/.config/fastfetch/ && ~/.config/oh-my-posh/" 
