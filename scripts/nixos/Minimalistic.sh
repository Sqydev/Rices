# Tu zrób ostrzeżenie że usunie config (lista żeczy)

# Remove Rices if exists
rm -rf ~/.config/Rices

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

# Tu zrób info co daje żeczy do dodania do config.nix
# Btw. Here's space so you can just do f.e. ":.,.+6s/ /pkgs." in vim
echo "List of pkgs to add to your nixos config:"
echo " hyprland"
echo " rofi"
echo " waybar"
echo " alacritty"
echo " fastfetch"
echo " waybar"
