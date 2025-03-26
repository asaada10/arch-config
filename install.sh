#!/bin/bash

# Verificar si paru está instalado
if ! command -v paru &> /dev/null; then
    echo "paru no está instalado. Instalando..."
    # Instalar paru
    sudo pacman -S --noconfirm base-devel git
    cd /tmp
    git clone https://aur.archlinux.org/cgit/aur.git/snapshot/paru.tar.gz
    tar -xvzf paru.tar.gz
    cd paru
    makepkg -si --noconfirm
    cd ..
    rm -rf paru paru.tar.gz
fi

# Lista de paquetes a instalar
PACKAGES=(
    7zip alacritty android-file-transfer android-studio android-tools anydesk-bin
    aquamarine arc-gtk-theme aria2 baobab base base-devel bind blender bluetui
    bluez bluez-utils brave-bin brightnessctl btop cbatticon cliphist composer
    cronie debugedit dosfstools dunst efibootmgr evtest fakeroot firefox flameshot
    flatpak fuse2 gimp git google-chrome gparted grub grub-customizer gsfonts
    gst-libav gst-plugins-good gvfs-mtp htop hyprcursor hyprgraphics hyprland
    hyprland-qtutils hyprlang hyprlock hyprshot imwheel inetutils jmtpfs jq
    kitty konsole lib32-vulkan-intel libratbag libva-nvidia-driver links linux
    linux-discord-rich-presence linux-firmware linux-lts-headers lutris make
    mariadb miru-bin mission-center mpv mpvpaper mtools mtpfs mysql-workbench
    nano neofetch neovim networkmanager nitrogen nodejs noto-fonts noto-fonts-cjk
    noto-fonts-emoji npm ntfs-3g nvidia nvidia-settings nvidia-utils obs-studio
    pacman-contrib pavucontrol php php-apache piper pipewire-alsa pipewire-jack
    pipewire-pulse pkgconf postgresql pulseaudio-alsa pv python-psutil
    qt5-graphicaleffects qt5-quickcontrols qtile rofi-lbonn-wayland-git rsync
    rustup ryujinx-bin sddm simple-mtpfs smartmontools speedtest-cli sshfs steam
    steamcmd sudo swaybg swww thunar tree ttf-fira-code ttf-jetbrains-mono-nerd
    ttf-liberation ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono
    udiskie ufw unityhub unrar unzip volumeicon vulkan-intel vulkan-tools waybar
    waylock weather-cli webkit2gtk wev wget whois wine wl-clipboard wlr-randr
    wlroots xclip xdg-desktop-portal-gnome xdg-desktop-portal-hyprland xdotool
    xf86-video-vesa xorg-bdftopcf xorg-docs xorg-font-util xorg-fonts-100dpi
    xorg-fonts-75dpi xorg-fonts-encodings xorg-iceauth xorg-mkfontscale
    xorg-server xorg-server-common xorg-server-devel xorg-server-xephyr
    xorg-server-xnest xorg-server-xvfb xorg-sessreg xorg-setxkbmap xorg-smproxy
    xorg-x11perf xorg-xauth xorg-xbacklight xorg-xcmsdb xorg-xcursorgen
    xorg-xdpyinfo xorg-xdriinfo xorg-xev xorg-xgamma xorg-xhost xorg-xinit
    xorg-xinput xorg-xkbcomp xorg-xkbevd xorg-xkbutils xorg-xkill xorg-xlsatoms
    xorg-xlsclients xorg-xmodmap xorg-xpr xorg-xprop xorg-xrandr xorg-xrdb
    xorg-xrefresh xorg-xset xorg-xsetroot xorg-xvinfo xorg-xwayland xorg-xwd
    xorg-xwininfo xorg-xwud xp-pen-tablet xterm xwinwrap-git yay-debug yt-dlp
    zip zsh
)

# Actualizar sistema y paquetes
sudo pacman -Syu --noconfirm

# Instalar paquetes
paru -S --needed --noconfirm "${PACKAGES[@]}"

# Mover las carpetas 'hypr', 'waybar' y 'scripts' a las ubicaciones adecuadas
echo "Moviendo las carpetas 'hypr', 'waybar' y 'scripts' a las ubicaciones adecuadas..."

# Asegurarte de que las carpetas existan antes de moverlas
if [ -d "$HOME/.config/hypr" ]; then
    mv "$HOME/.config/hypr" "$HOME/hypr"
    echo "Carpeta 'hypr' movida a $HOME/hypr"
fi

if [ -d "$HOME/.config/waybar" ]; then
    mv "$HOME/.config/waybar" "$HOME/waybar"
    echo "Carpeta 'waybar' movida a $HOME/waybar"
fi

if [ -d "$HOME/scripts" ]; then
    mv "$HOME/scripts" "$HOME/scripts"
    echo "Carpeta 'scripts' movida a $HOME/scripts"
fi

echo "Proceso completado."
