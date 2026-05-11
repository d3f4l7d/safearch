echo
echo " _   _      _ _        __        __         _     _ _ "
echo "| | | | ___| | | ___   \ \      / /__  _ __| | __| | |"
echo "| |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _' | |"
echo "|  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|"
echo "|_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)"
echo


echo "There is no choice to install 'git', right?"


sudo pacman -Syu --noconfirm


sudo pacman -S --noconfirm openssh ufw xorg
sudo systemctl start sshd && sudo systemctl start ufw
sudo systemctl enable sshd && sudo systemctl enable ufw


if pacman -Q zsh &> /dev/null; then
    echo "zsh is already installed. Skip ZSH process..."
else
    echo 
    echo " _________  _   _ "
    echo "|__  / ___|| | | |"
    echo "  / /\___ \| |_| |"
    echo " / /_ ___) |  _  |"
    echo "/____|____/|_| |_|"
    echo

    sudo pacman -Syu
    sudo pacman -S --noconfirm kitty zsh wget ttf-fira-code
    echo "Make sure to change 'd3f4l7' to <yourusername>"
    sudo chsh -s /bin/zsh d3f4l7
    sudo cat /etc/passwd | grep d3f4l7
    echo "'exit' to exit oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    wget -O ~/.oh-my-zsh/themes/kali-like.zsh-theme https://raw.githubusercontent.com/clamy54/kali-like-zsh-theme/master/kali-like.zsh-theme
    echo "Replace NEWLINE_BEFORE_PROMPT=yes to no on ~/.oh-my-zsh/themes/kali-like.zsh-theme."
    echo "Replace val of ZSH_THEME from robbyrussell to kali-like."
    echo "Also, do not forget exec kitty +list-fonts locally after reboot"
    echo "autoinstall of zsh -- DONE"

    echo
    echo " ____  _____ ____   ___   ___ _____   _   _  _____        __"
    echo "|  _ \| ____| __ ) / _ \ / _ \_   _| | \ | |/ _ \ \      / /"
    echo "| |_) |  _| |  _ \| | | | | | || |   |  \| | | | \ \ /\ / / "
    echo "|  _ <| |___| |_) | |_| | |_| || |   | |\  | |_| |\ V  V /  "
    echo "|_| \_\_____|____/ \___/ \___/ |_|   |_| \_|\___/  \_/\_/   "
    echo
    exit
    
fi


if pacman -Q neovim &> /dev/null; then
    echo "neovim is already installed. Skip NvChad process..."
else
    echo
    echo " _   ___     ______ "
    echo "| \ | \ \   / / ___|"
    echo "|  \| |\ \ / / |    "
    echo "| |\  | \ V /| |___ "
    echo "|_| \_|  \_/  \____|"
    echo

    sudo pacman -S --noconfirm neovim ttf-jetbrains-mono-nerd unzip
    echo "Wait until the installation is done"
    echo "Then, ctrl + q once, and space + th to set the theme (I love scaryforest) on nvim"
    git clone https://github.com/NvChad/starter ~/.config/nvim
    nvim
    
    echo "autoinstall of NvChad -- DONE"
fi


if pacman -Q python-pip &> /dev/null; then
    echo "python-pip is already installed. Skip PY process..."
    echo "pyenv install 3.10 (3.10.19)"
    echo "pyenv local 3.10.19"
    echo "pyenv global 3.10.19"
    echo "pyenv virtualenv 3.10.19 venv10"
    echo "if you are too lazy to change venv, do pyenv global venv10"
    echo "Later you can do pyenv global system"
else
    echo
    echo " ______   __"
    echo "|  _ \ \ / /"
    echo "| |_) \ V / "
    echo "|  __/ | |  "
    echo "|_|    |_|  "
    echo  

    sudo pacman -S --noconfirm python python-pip tk
    rm -rf  ~/.pyenv
    curl -fsSL https://pyenv.run | zsh
    echo >> ~/.zshrc
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin: $PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc
    echo "exec "$SHELL" manually"
    rm -rf  ~/.pyenv/plugins/pyenv-virtualenv
    git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
    echo "exec "$SHELL" manually"

    echo "autoinstall of Python -- DONE"
fi


if ! command -v ghc &> /dev/null
then
    echo
    echo " _   _    _    ____  "
    echo "| | | |  / \  / ___| "
    echo "| |_| | / _ \ \___ \ "
    echo "|  _  |/ ___ \ ___) |"
    echo "|_| |_/_/   \_\____/ "
    echo

    echo "DYYAYY"
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
    echo "autoinstall of Haskell -- DONE"

else
    echo "exec "$SHELL" manually"
    echo "source ~/.zshrc"
    echo "Haskell is already installed. Skip HAS process..."
    ghc --version
    which haskell-language-server-wrapper
fi


if pacman -Q arduino-cli &> /dev/null; then
    echo "arduino-cli is already installed. Skip ARDCLI process..."
else
    echo
    echo "    _    ____  ____   ____ _     ___ "
    echo "   / \  |  _ \|  _ \ / ___| |   |_ _|"
    echo "  / _ \ | |_) | | | | |   | |    | | "
    echo " / ___ \|  _ <| |_| | |___| |___ | | "
    echo "/_/   \_\_| \_\____/ \____|_____|___|"
    echo

    sudo pacman -S --noconfirm arduino-cli
    arduino-cli help core
  
    echo "autoinstall of arduino-cli -- DONE"
fi


if pacman -Q cdparanoia &> /dev/null; then
    echo "cdparanoia is already installed. Skip CDDA process..."
else
    echo
    echo "  ____ ____  ____    _    "
    echo " / ___|  _ \|  _ \  / \   "
    echo "| |   | | | | | | |/ _ \  "
    echo "| |___| |_| | |_| / ___ \ "
    echo " \____|____/|____/_/   \__"
    echo

    sudo pacman -S --noconfirm cdparanoia
  
    echo "autoinstall of cdparanoia -- DONE"
fi


if ! command -v ddgr &> /dev/null
then
    echo
    echo " ____  ____   ____ ____  "
    echo "|  _ \|  _ \ / ___|  _ \ "
    echo "| | | | | | | |  _| |_) |"
    echo "| |_| | |_| | |_| |  _ < "
    echo "|____/|____/ \____|_| \_|"
    echo

    git clone https://github.com/jarun/ddgr ~/.config/ddgr
    cd ~/.config/ddgr/
    sudo make install
    echo "ctrl + c to exit"
    ./ddgr
    echo "autoinstall of ddgr -- DONE"
    
else
    echo "ddgr is already installed. Skip DDGR process..."
fi


echo
echo " _   _      _ _        __        __         _     _ _ "
echo "| | | | ___| | | ___   \ \      / /__  _ __| | __| | |"
echo "| |_| |/ _ \ | |/ _ \   \ \ /\ / / _ \| '__| |/ _' | |"
echo "|  _  |  __/ | | (_) |   \ V  V / (_) | |  | | (_| |_|"
echo "|_| |_|\___|_|_|\___/     \_/\_/ \___/|_|  |_|\__,_(_)"
echo
echo
echo " ____  _____ ____   ___   ___ _____   _   _  _____        __"
echo "|  _ \| ____| __ ) / _ \ / _ \_   _| | \ | |/ _ \ \      / /"
echo "| |_) |  _| |  _ \| | | | | | || |   |  \| | | | \ \ /\ / / "
echo "|  _ <| |___| |_) | |_| | |_| || |   | |\  | |_| |\ V  V /  "
echo "|_| \_\_____|____/ \___/ \___/ |_|   |_| \_|\___/  \_/\_/   "
echo
