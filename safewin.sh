echo
echo " ____    _    _____ _______        _____ _   _ "
echo "/ ___|  / \  |  ___| ____\ \      / /_ _| \ | |"
echo "\___ \ / _ \ | |_  |  _|  \ \ /\ / / | ||  \| |"
echo " ___) / ___ \|  _| | |___  \ V  V /  | || |\  |"
echo "|____/_/   \_\_|   |_____|  \_/\_/  |___|_| \_|"
echo

sudo -s
mkdir /mnt/windowsEFI
mount /dev/nvme0n1p1 /mnt/windowsEFI
cd /mnt/windowsEFI/EFI
cp -r Microsoft /boot/EFI
cd /boot/EFI/Microsoft/Boot
echo "title        Windows11  Boot  Manager" >> /boot/loader/entries/windows.conf
echo "efi        /boot/EFI/Microsoft/Boot/bootmgfw.efi" >> /boot/loader/entries/windows.conf
echo "timeout 3" >> /boot/loader/loader.conf

echo
echo "__   _____  _   _ _     ___  ____  _____ "
echo "\ \ / / _ \| | | | |   / _ \/ ___|| ____|"
echo " \ V / | | | | | | |  | | | \___ \|  _|  "
echo "  | || |_| | |_| | |__| |_| |___) | |___ "
echo "  |_| \___/ \___/|_____\___/|____/|_____|"
echo
