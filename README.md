# 🛠️ Arch Linux Dotfiles - High Performance Setup

Repositorio destinado a la gestión centralizada y automatización de configuraciones para mi entorno Arch Linux de alto rendimiento. Diseñado con una filosofía híbrida: máxima velocidad en terminal y confort visual para sesiones extensas de desarrollo.

---

## 🎯 Stack Tecnológico Seleccionado e Integrado

* **WM / Compositor:** Hyprland (Wayland nativo con aceleración por GPU para Intel Iris Plus)
* **Terminal:** Kitty (Emulador hiperveloz acelerado por GPU)
* **Shell:** Fish Shell (Configurado con alias de velocidad y pathing automatizado)
* **Editor de Código:** VS Code (Sesiones largas vía Wayland nativo) y Helix (Edición rápida y minimalista en terminal)
* **Lanzador de Aplicaciones:** Rofi (Wayland-fork con variante C en el centro estilo terminal hacker)
* **Barra de Estado:** Waybar (Estructura modular de islas flotantes óvalas, módulos nativos de red, batería, reloj e idioma)
* **Gestor de Salida y Energía:** Wlogout (Menú de apagado con desenfoque nativo sobre la sesión)
* **Gestor de Archivos:** Yazi (Explorador asíncrono basado en terminal)
* **Notificaciones:** Mako (Notificaciones ligeras para Wayland)
* **AUR Helper:** Yay (Gestor de paquetes de la comunidad de Arch)

---

## 🗒️ Diario de Progreso

- [x] Crear el perfil limpio aislado en hardware dual-boot.
- [x] Instalar y enlazar componentes base (`hyprland`, `kitty`, `fish`, `helix`).
- [x] Configurar Git global, llaves criptográficas SSH y archivo `.gitignore`.
- [x] Mapear los atajos básicos de teclado (`SUPER + .` para Kitty y reubicación de la zona derecha).
- [x] Crear e integrar el script de automatización general `install.sh` forzado en Git.
- [x] Implementar el lanzador Rofi en el centro con estética minimalista de fósforo verde (`SUPER + R`).
- [x] Diseñar la barra Waybar en formato de islas óvalas independientes y transparentes.
- [x] Resolver bug crítico de propiedades de renderizado CSS en los workspaces dinámicos de Waybar.
- [x] Configurar el bloque nativo `input` en Hyprland para admitir doble distribución de teclado (`es,us`).
- [x] Mapear el intercambio de idioma al vuelo con `SUPER + Espacio` reflejado nativamente en la barra.
- [x] Desarrollar la función modular en Fish para desvincular procesos (`code .`) y cerrar la terminal Kitty de forma limpia y automática.
- [x] Integrar `wlogout` desde el AUR mediante `yay` para gestionar el apagado estético del sistema.

---

## 📥 Cómo replicar este entorno desde cero

Si es necesario formatear la máquina o replicar este entorno en un hardware limpio, los pasos secuenciales para recuperar todo en menos de 5 minutos son:

### 1. Configurar las llaves SSH en GitHub
Asegurarse de generar la llave e importarla en la interfaz web de GitHub para poder clonar y empujar cambios de forma segura sin contraseñas:
```bash
ssh-keygen -t ed25519 -C "gobanacho@gmail.com"
cat ~/.ssh/id_ed25519.pub

### 2. Clonar el repositorio en la carpeta de configuracion de usuario

git clone git@github.com:IgnacioBarboza/dotfiles.git ~/.config

### 3. Ejecutar el instalador automático

cd ~/.config
chmod +x install.sh
./install.sh