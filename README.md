# 🛠️ Arch Linux Dotfiles - High Performance Setup

Repositorio destinado a la gestión centralizada de configuraciones para mi entorno Arch Linux de alto rendimiento.

## 🎯 Stack Tecnológico Seleccionado:
- **WM / Compositor:** Hyprland (Wayland)
- **Terminal:** Kitty
- **Shell:** Fish
- **Editor:** Helix
- **File Manager:** Yazi
- **Lanzador de Apps:** Rofi-Wayland
- **Notificaciones:** Mako
- **AUR Helper:** Yay

## 🗒️ Diario de Progreso:
- [x] Crear el perfil limpio aislado.
- [x] Instalar componentes base (`hyprland`, `kitty`, `fish`, `helix`).
- [x] Configurar Git global y archivo `.gitignore`.
- [x] Mapear los atajos básicos de teclado en `hyprland.conf`.


## 🛠️ Stack Tecnológico Integrado
* **Compositor:** Hyprland (Wayland nativo)
* **Terminal:** Kitty
* **Shell:** Fish Shell (con alias de velocidad)
* **Editor de Código:** VS Code (para sesiones largas) & Helix (para edición rápida en terminal)
* **Gestor de Archivos:** Yazi (Terminal-based)
* **Lanzador de Apps:** Rofi (Wayland-fork)

## 📥 Cómo replicar este entorno desde cero

Si formateo la máquina o instalo Arch de cero, los pasos para recuperar todo son:

### 1. Configurar tus llaves SSH en GitHub
Asegurarse de generar la llave e importarla en la cuenta para poder clonar y empujar cambios sin contraseñas:
```bash
ssh-keygen -t ed25519 -C "gobanacho@gmail.com"

### 2. Clonar el repositorio en la carpeta de configuración

git clone git@github.com:IgnacioBarboza/dotfiles.git ~/.config

### 3. Ejecutar el instalador automático

cd ~/.config
./install.sh