#!/bin/bash
# Archivo post instalación para Xubuntu 23.10
# Actualiza la información de los repositorios
sudo apt update

# Instalar paquetes nuevos sin GUI
sudo apt install -y ssh wireguard avahi-daemon ethtool wakeonlan \
    nmon nload iftop iperf axel aria2 curl wget rsync git \
    bash-completion htop ncdu mc tmux pwgen lm-sensors most bat \
    lvm2 dosfstools rar unrar unp unzip libemail-outlook-message-perl \
    mpack ffmpeg imagemagick yubikey-luks \
    tesseract-ocr tesseract-ocr-eng tesseract-ocr-spa

# Instalar paquetes nuevos con GUI
sudo apt install -y handbrake vlc subtitleeditor zenity \
    transmission-gtk transmission-remote-gtk filezilla \
    inkscape nomacs nomacs-l10n yubikey-manager-qt kdeconnect \
    simple-scan pdfarranger gimagereader\

# Instalar paquetes SNAP
sudo snap install codium

# Desinstalar paquetes preinstalados
sudo apt remove -y atril ristretto parole rhythmbox \
    rhythmbox-plugin-alternative-toolbar rhythmbox-data rhythmbox-plugins

# Limpia todo
sudo apt autoremove -y
sudo apt clean