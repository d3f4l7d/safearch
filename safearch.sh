echo
echo " ____    _    _____ _____    _    ____   ____ _   _ "
echo "/ ___|  / \  |  ___| ____|  / \  |  _ \ / ___| | | |"
echo "\___ \ / _ \ | |_  |  _|   / _ \ | |_) | |   | |_| |"
echo " ___) / ___ \|  _| | |___ / ___ \|  _ <| |___|  _  |"
echo "|____/_/   \_\_|   |_____/_/   \_\_| \_\\____|_| |_|"
echo

timedatectl set-ntp true
cfdisk /dev/nvme0n1
echo "select gpt"
echo ""
