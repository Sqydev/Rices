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
function Confirmation
  while true
    read -p 'echo "> "' -l confirm

    switch $confirm
      case 1
        return 0
      case '' 2
        return 1
    end
  end
end

if Confirmation

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

# Link new ones
ln -s ~/.config/Rices/Types/Minimalistic/hypr ~/.config/hypr
ln -s ~/.config/Rices/Types/Minimalistic/rofi ~/.config/rofi
ln -s ~/.config/Rices/Types/Minimalistic/waybar ~/.config/waybar
ln -s ~/.config/Rices/Types/Minimalistic/alacritty ~/.config/alacritty
ln -s ~/.config/Rices/Types/Minimalistic/fastfetch ~/.config/fastfetch

# Print things to download
# Btw. Here's space so you can just do f.e. ":.,.+6s/ /pkgs." in vim
echo "List of pkgs to add to your nixos config:"
echo " hyprland"
echo " rofi"
echo " waybar"
echo " alacritty"
echo " fastfetch"
echo " waybar"

end
