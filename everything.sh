#!/bin/bash
clear
cd ~ > /dev/null 2>&1
sudo apt install -y lolcat figlet git wget > /dev/null 2>&1
clear
figlet Dookie | lolcat

read -p "Install AMD drivers? [Y/N] " choice
case "$choice" in
y|Y ) echo Installing AMD drivers...;
    wget https://transfer.sh/get/ritl8K/amdgpu-pro-21.30-1290604-ubuntu-20.04.tar.xz --progress=bar:force 2>&1 | tail -f -n +8;
    tar -xvf amdgpu-pro* > /dev/null 2>&1;
    rm amdgpu-pro-21.30-1290604-ubuntu-20.04.tar.xz > /dev/null 2>&1;
    mv amdgpu-pro-21.30-1290604-ubuntu-20.04/ amdgpu/ > /dev/null 2>&1;
    cd amdgpu/ > /dev/null 2>&1;
    chmod +x amdgpu-install > /dev/null 2>&1;
    ./amdgpu-install -y > /dev/null 2>&1;
    rm -rf amdgpu/
    sudo usermod -a -G video $USER > /dev/null 2>&1;
    echo "blacklist radeon" | sudo tee -a /etc/modprobe.d/blacklist.conf > /dev/null 2>&1;
    cd /etc/default/ > /dev/null 2>&1;
    sudo mv grub grub.bak > /dev/null 2>&1;
    sudo wget https://doookkie.github.io/grub --progress=bar:force 2>&1 | tail -f -n +8;
    sudo update-grub > /dev/null 2>&1;
    wget https://github.com/GPUOpen-Drivers/AMDVLK/releases/download/v-2021.Q3.7/amdvlk_2021.Q3.7_amd64.deb --progress=bar:force 2>&1 | tail -f -n +8;
    sudo apt install -y "/home/$USER/amdvlk_2021.Q3.7_amd64.deb" > /dev/null 2>&1;
    rm amdvlk_2021.Q3.7_amd64.deb
    sudo add-apt-repository -y ppa:oibaf/graphics-drivers > /dev/null 2>&1;
    sudo apt update -y > /dev/null 2>&1;
    sudo apt upgrade -y > /dev/null 2>&1;
    cd ~ > /dev/null 2>&1;
    echo Done!;;
n|N ) echo Not installing AMD drivers...
esac
echo
read -p "Install Steam? [Y/N] " choice
case "$choice" in
y|Y ) echo Installing Steam...;
    sudo apt update -y > /dev/null 2>&1;
    sudo apt install -y steam-installer > /dev/null 2>&1;
    echo Done!;;
n|N ) echo Not installing Steam...
esac
echo
read -p "Install Discord? [Y/N] " choice 
case "$choice" in
y|Y ) echo Installing Discord...;
    wget https://dl.discordapp.net/apps/linux/0.0.16/discord-0.0.16.deb --progress=bar:force 2>&1 | tail -f -n +8;
    sudo apt install -y "/home/$USER/discord-0.0.16.deb" > /dev/null 2>&1;
    rm discord-0.0.16.deb > /dev/null 2>&1;
    echo Done!;;
n|N ) echo Not installing Discord...
esac
echo
read -p "Install Cadmus? [Y/N] " choice
case "$choice" in
y|Y ) echo Installing Cadmus...;
    wget https://github.com/josh-richardson/cadmus/releases/download/0.0.3/cadmus.deb --progress=bar:force 2>&1 | tail -f -n +13;
    sudo apt install -y "/home/$USER/cadmus.deb" > /dev/null 2>&1;
    rm cadmus.deb > /dev/null 2>&1;
    sudo cp /usr/share/applications/cadmus.desktop .config/autostart/ > /dev/null 2>&1;
    echo Done!;;
n|N ) echo Not installing Cadmus...
esac
echo
read -p "Install Random Essentials? [Y/N] " choice
case "$choice" in
y|Y ) echo Installing Wine Staging...;
    wget -nc https://dl.winehq.org/wine-builds/winehq.key > /dev/null 2>&1;
    sudo apt-key add -y winehq.key > /dev/null 2>&1;
    sudo rm winehq.key > /dev/null 2>&1;
    sudo add-apt-repository -y 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main'  > /dev/null 2>&1;
    sudo apt update -y > /dev/null 2>&1;
    sudo apt install -y --install-recommends winehq-staging > /dev/null 2>&1;
    echo Installing Lutris...;
    sudo add-apt-repository -y ppa:lutris-team/lutris > /dev/null 2>&1;
    sudo apt update -y > /dev/null 2>&1;
    sudo apt install -y lutris > /dev/null 2>&1;
    echo "Setting SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0 in /etc/environment";
    echo "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0" | sudo tee -a /etc/environment > /dev/null 2>&1;;
n|N ) echo Not installing Random Essentials...
esac
echo
echo Done! | lolcat
echo You should reboot now.
