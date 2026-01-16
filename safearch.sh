echo
echo " ____    _    _____ _____    _    ____   ____ _   _ "
echo "/ ___|  / \  |  ___| ____|  / \  |  _ \ / ___| | | |"
echo "\___ \ / _ \ | |_  |  _|   / _ \ | |_) | |   | |_| |"
echo " ___) / ___ \|  _| | |___ / ___ \|  _ <| |___|  _  |"
echo "|____/_/   \_\_|   |_____/_/   \_\_| \_\\____|_| |_|"
echo

timedatectl set-ntp true
fdisk /dev/nvme0n1
echo "g"
echo "n"
echo "1 (default)"
echo "2048 (default)"
echo "+500M"
echo "t"
echo "L"
echo "1"
echo "n"
echo "2 (Default)"
echo "1026048 (default)"
echo "209715166 (default)"
echo "w"
mkfs.fat -F32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
mount /dev/nvme0n1p2 /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
pacman -Sy archlinux-keyring
pacstrap /mnt base linux linux-headers linux-firmware vim linux-lts linux-lts-headers
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
fallocate -l 2GB /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile none swap defaults 0 0" >> /etc/fstab
ln -sf /usr/share/zoneinfo/Japan /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "n4m3h3r3p134z" >> /etc/hostname
echo "127.0.0.1        localhost" >> /etc/hosts
echo "::1              localhost" >> /etc/hosts
echo "127.0.1.1        n4m3h3r3p134z.localdomain        n4m3h3r3p134z" >> /etc/hosts
passwd
pacman -S efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base-devel
bootctl --path=/boot install
echo "timeout 3" >> /boot/loader/loader.conf
echo "default n4m3h3r3p134z-*" >> /boot/loader/loader.conf
echo "title    Arch Linux" >> /boot/loader/entries/n4m3h3r3p134z.conf
echo "linux    /vmlinuz-linux" >> /boot/loader/entries/n4m3h3r3p134z.conf
echo "initrd    /initramfs-linux.img" >> /boot/loader/entries/n4m3h3r3p134z.conf
echo "options    root=/dev/nvme0n1p2 rw" >> /boot/loader/entries/n4m3h3r3p134z.conf
cd
systemctl enable NetworkManager
useradd -mG wheel d3f4l7d
passwd d3f4l7d
echo "Uncomment 1st wheel"
EDITOR=vim visudo
exit
umount -a
reboot

sudo pacman -S openssh ufw xorg 
sudo systemctl start sshd && sudo systemctl start ufw
sudo systemctl enable sshd && sudo systemctl enable ufw

echo
echo " _   _      _ _        __        __         _     _ _ "
echo "| | | | ___| | | ___   \ \      / /__  _ __| | __| | |"
echo "| |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _` | |"
echo "|  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|"
echo "|_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)"
echo
