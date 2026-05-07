sudo pacman -S openssh ufw xorg git
sudo systemctl start sshd && sudo systemctl start ufw
sudo systemctl enable sshd && sudo systemctl enable ufw
