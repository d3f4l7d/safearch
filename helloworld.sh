echo
echo " _   _      _ _        __        __         _     _ _ "
echo "| | | | ___| | | ___   \ \      / /__  _ __| | __| | |"
echo "| |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _' | |"
echo "|  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|"
echo "|_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)"
echo


sudo pacman -S --noconfirm openssh ufw xorg git
sudo systemctl start sshd && sudo systemctl start ufw
sudo systemctl enable sshd && sudo systemctl enable ufw


echo
echo " _   _      _ _        __        __         _     _ _ "
echo "| | | | ___| | | ___   \ \      / /__  _ __| | __| | |"
echo "| |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _' | |"
echo "|  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|"
echo "|_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)"
echo
