#!/bin/bash

# =============================================================================
# 🚀 SCRIPT DE INSTALACIÓN AUTOMÁTICA DE DOTFILES (ACTUALIZADO)
# =============================================================================

echo "=========================================="
echo "  Iniciando la reconstrucción del sistema "
echo "=========================================="

# 1. Actualizar el sistema base
echo "--> Actualizando repositorios de Pacman..."
sudo pacman -Syu --noconfirm

# 2. Instalar el Stack Tecnológico Principal
echo "--> Instalando herramientas de terminal, entorno y dependencias de Hyprland..."
sudo pacman -S --noconfirm \
    kitty \
    fish \
    helix \
    yazi \
    rofi-wayland \
    code \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    git \
    libnotify \
    ffmpegthumbnailer \
    p7zip \
    jq \
    poppler \
    fd \
    ripgrep \
    fzf \
    imagemagick \
    dunst \
    waybar \
    wireplumber \
    brightnessctl \
    playerctl \
    grim \
    
# 3. Configurar Fish como la Shell por defecto
echo "--> Configurando Fish como la shell predeterminada..."
sudo usermod -s /usr/bin/fish $USER

echo "=========================================="
echo " ¡Instalación completada con éxito!       "
echo " Reiniciá la sesión para aplicar los cambios."
echo "=========================================="