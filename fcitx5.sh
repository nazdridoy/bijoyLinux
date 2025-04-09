#!/bin/bash

#====================[ Color Definitions ]====================#
red="\e[1;31m"
green="\e[1;32m"
yellow="\e[1;33m"
blue="\e[1;34m"
magenta="\e[1;1;35m"
cyan="\e[1;36m"
orange="\x1b[38;5;214m"
end="\e[1;0m"

attention="[${orange} ATTENTION ${end}]"
action="[${green} ACTION ${end}]"
note="[${magenta} NOTE ${end}]"
done="[${cyan} DONE ${end}]"
ask="[${orange} QUESTION ${end}]"
error="[${red} ERROR ${end}]"

#====================[ Display Banner ]====================#
display_text() {
    cat << "EOF"
 ____  _  _
| __ )(_)(_) ___  _   _
|  _ \| || |/ _ \| | | |
| |_) | || | (_) | |_| |
|____/|_|/ |\___/ \__, |
       |__/       |___/
 _  __          _                         _
| |/ /___ _   _| |__   ___   __ _ _ __ __| |
| ' // _ \ | | | '_ \ / _ \ / _` | '__/ _` |
| . \  __/ |_| | |_) | (_) | (_| | | | (_| |
|_|\_\___|\__, |_.__/ \___/ \__,_|_|  \__,_|
          |___/
EOF
}

clear && display_text
printf " \n \n"

#====================[ Startup & Logging ]====================#
present_dir="$(dirname "$(realpath "$0")")"
log="$present_dir/Install.log"

if [[ ! -f "$log" ]]; then
    touch "$log"
fi

#====================[ Package Manager Detection ]====================#
if command -v pacman &> /dev/null; then
    pkg="pacman"
elif command -v dnf &> /dev/null; then
    pkg="dnf"
elif command -v zypper &> /dev/null; then
    pkg="zypper"
elif command -v xbps-install &> /dev/null; then
    pkg="xbps-install"
elif command -v apt &> /dev/null; then
    pkg="apt"
elif command -v eopkg &> /dev/null; then
    pkg="eopkg"
elif command -v apk &> /dev/null; then
    pkg="apk"
else
    printf "${error}\n! No supported package manager found!\n"
    exit 1
fi

#====================[ Fcitx5 Installation ]====================#
printf "${attention}\n!! Installing necessary packages using ${pkg}...\n"

case "$pkg" in
    pacman)
        sudo pacman -S --noconfirm fcitx5 fcitx5-configtool fcitx5-qt fcitx5-gtk fcitx5-m17n git
        ;;
    dnf)
        sudo dnf install -y git fcitx5 fcitx5-configtool fcitx5-m17n fcitx5-qt5
        ;;
    zypper)
        sudo zypper in -y git fcitx5-devel fcitx5 fcitx5-configtool fcitx5-m17n
        ;;
    xbps-install)
        sudo xbps-install -y fcitx5 fcitx5-configtool fcitx5-m17n git
        ;;
    apt)
        sudo apt install -y fcitx5 fcitx5-config-qt git fcitx5-m17n
        ;;
    *)
        printf "${error}\n! Unsupported package manager: $pkg\n"
        exit 1
        ;;
esac

#====================[ Clone the Repository ]====================#
printf "${action} Cloning OpenBangla Bijoy repository...\n"
git clone https://github.com/asifakonjee/bijoy-modified || {
    printf "${error} Git clone failed!\n"
    exit 1
}
cd bijoy-modified || {
    printf "${error} Failed to enter bijoy-modified directory.\n"
    exit 1
}

#====================[ Copy m17n.d Files ]====================#
if [ -d "m17n.d" ]; then
    printf "${action} Copying m17n.d contents to /usr/share/m17n/ ...\n"
    sudo cp -v m17n.d/* /usr/share/m17n/
else
    printf "${error} m17n.d directory not found!\n"
fi

#====================[ Display Font Banner ]====================#
printf "\n"
cat << "EOF"
 ___           _        _ _ _               _____           _
|_ _|_ __  ___| |_ __ _| | (_)_ __   __ _  |  ___|__  _ __ | |_ ___
 | || '_ \/ __| __/ _` | | | | '_ \ / _` | | |_ / _ \| '_ \| __/ __|
 | || | | \__ \ || (_| | | | | | | | (_| | |  _| (_) | | | | |_\__ \
|___|_| |_|___/\__\__,_|_|_|_|_| |_|\__, | |_|  \___/|_| |_|\__|___/
                                    |___/
EOF
printf "\n"

#====================[ Install Fonts ]====================#
printf "${action} Installing ANSI and Unicode fonts...\n"

font_dir="$HOME/.local/share/fonts"
mkdir -p "$font_dir"

if [ -d "fonts/ANSI" ]; then
    cp -rv fonts/ANSI "$font_dir/"
fi
if [ -d "fonts/Unicode" ]; then
    cp -rv fonts/Unicode "$font_dir/"
fi

#====================[ Refresh Font Cache ]====================#
printf "${action} Refreshing font cache...\n"
sudo fc-cache -fv

#====================[ Cleanup ]====================#
printf "${action} Removing cloned bijoy-modified directory...\n"
cd "$present_dir" && rm -rf bijoy-modified

#====================[ Done ]====================#
printf "${done} All tasks completed successfully!\n"
