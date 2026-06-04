if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Atajo definitivo para VS Code nativo en Wayland y con pathing automático
function code
    command code --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations $argv
end

# Alias basicos

alias hx="helix"

# Escribir 'y' en la terminal abrirá el gestor de archivos Yazi al instante
alias y="yazi"

# Atajos rápidos para Git (Para no escribir tanto comando largo)
alias gst="git status"
alias gadd="git add ."
alias gcm="git commit -m"
alias gpush="git push"
