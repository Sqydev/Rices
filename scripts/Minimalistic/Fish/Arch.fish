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
rm -rf ~/.config/oh-my-posh

# Link new ones
ln -s ~/.config/Rices/rices/Minimalistic/hypr ~/.config/hypr
ln -s ~/.config/Rices/rices/Minimalistic/rofi ~/.config/rofi
ln -s ~/.config/Rices/rices/Minimalistic/waybar ~/.config/waybar
ln -s ~/.config/Rices/rices/Minimalistic/alacritty ~/.config/alacritty
ln -s ~/.config/Rices/rices/Minimalistic/fastfetch ~/.config/fastfetch
ln -s ~/.config/Rices/rices/Minimalistic/oh-my-posh ~/.config/oh-my-posh
ln -s ~/.config/Rices/rices/Minimalistic/waypaper ~/.config/waypaper

# Download pkgs
sudo pacman -S hyprland
sudo pacman -S rofi
sudo pacman -S waybar
sudo pacman -S alacritty
sudo pacman -S fastfetch
sudo pacman -S waypaper

# Inform user
echo
echo
echo "Now it's to you to setup your shell. If you want my ohmyposh && fastfetch you have it's config in ~/.config/oh-my-posh/ && ~/.config/fastfetch/"
echo

end
