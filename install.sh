#!/bin/bash

# =============================================================================
# 🚀 SCRIPT DE INSTALACIÓN AUTOMÁTICA DE DOTFILES (ACTUALIZADO CON STOW)
# =============================================================================

echo "=========================================="
echo "  Iniciando la reconstrucción del sistema "
echo "=========================================="

# 1. Actualizar el sistema base
echo "--> Actualizando repositorios de Pacman..."
sudo pacman -Syu --noconfirm

# 2. Instalar el Stack Tecnológico Principal (Repositorios Oficiales)
echo "--> Instalando entorno, terminales, utilidades y lenguajes..."
sudo pacman -S --noconfirm \
    hyprland \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    waybar \
    mako \
    hyprpaper \
    swaybg \
    wlogout \
    wev \
    rofi-wayland \
    kitty \
    fish \
    helix \
    neovim \
    code \
    yazi \
    nautilus \
    git \
    stow \
    base-devel \
    libnotify \
    ffmpegthumbnailer \
    p7zip \
    jq \
    poppler \
    fd \
    ripgrep \
    fzf \
    imagemagick \
    brightnessctl \
    playerctl \
    grim \
    fastfetch \
    network-manager-applet \
    pipewire \
    pipewire-audio \
    pipewire-pulse \
    pipewire-alsa \
    wireplumber \
    pamixer \
    python-pywal \
    xdg-user-dirs \
    btop \
    evolution \
    gimp \
    firefox \
    dotnet-sdk \
    aspnet-runtime \
    jdk-openjdk

# 3. Crear carpetas de usuario estándar
echo "--> Creando directorios de usuario..."
xdg-user-dirs-update

# 4. Compilar e instalar 'yay' (Helper de AUR)
echo "--> Instalando yay..."
if ! command -v yay &> /dev/null; then
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ~
else
    echo "yay ya está instalado."
fi

# 5. Instalar aplicaciones y herramientas desde AUR
echo "--> Instalando paquetes adicionales desde AUR..."
yay -S --noconfirm \
    brave-bin \
    spotify \
    vesktop-bin \
    swayosd-git \
    notion-app-electron \
    dbeaver-ce

# 6. Configurar Fish como la Shell por defecto
echo "--> Configurando Fish como la shell predeterminada..."
sudo usermod -s /usr/bin/fish $USER

# 7. Clonar y aplicar Dotfiles con GNU Stow
echo "--> Configurando dotfiles con GNU Stow..."

# Limpiamos archivos por defecto para evitar conflictos con Stow
rm -rf ~/.bashrc ~/.config/hypr ~/.config/kitty ~/.config/waybar ~/.config/rofi

# Clonamos tu repositorio
git clone https://github.com/IgnacioBarboza/dotfiles.git ~/dotfiles

# Entramos al directorio
cd ~/dotfiles

# Usamos el comodín */ para que Stow solo enlace los directorios 
# (ej. kitty/, hypr/) y omita archivos sueltos o la carpeta oculta .git
stow -t ~ */

echo "=========================================="
echo " ¡Instalación base completada con éxito!  "
echo " Reiniciá la sesión para aplicar los cambios."
echo "=========================================="
