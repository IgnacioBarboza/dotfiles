#!/bin/bash

# =============================================================================
# 🚀 SCRIPT DE INSTALACIÓN AUTOMÁTICA DE DOTFILES
# =============================================================================

echo "=========================================="
echo "  Iniciando la reconstrucción del sistema "
echo "=========================================="

# 1. Actualizar el sistema base
echo "--> Actualizando repositorios de Pacman..."
sudo pacman -Syu --noconfirm

# 2. Instalar el Stack Tecnológico Principal
echo "--> Instalando herramientas de terminal y entorno..."
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
    mako \
    libnotify

# 3. Configurar Fish como la Shell por defecto
echo "--> Configurando Fish como la shell predeterminada..."
sudo usermod -s /usr/bin/fish $USER

echo "=========================================="
echo " ¡Instalación completada con éxito!       "
echo " Reiniciá la sesión para aplicar los cambios."
echo "=========================================="