if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Atajo definitivo para VS Code nativo en Wayland y con pathing automático
function code
    command code $argv --detach >/dev/null 2>&1
    if contains "." $argv or test (count $argv) -eq 0
        kill -9 (pgrep -o kitty) # Mata de forma segura la terminal actual desde donde lo invocaste
    end
end

# Codigo para agregar sudo con esc + esc
function prepend_sudo_or_fallback
    set -l cmd (commandline)
    if test -z "$cmd"
        commandline -r "sudo $history[1]"
    else
        commandline -C 0
        commandline -i "sudo "
    end
    commandline -f end-of-line
end

# Asignar la función a la secuencia Esc Esc (\e\e)
function fish_user_key_bindings
    bind \e\e prepend_sudo_or_fallback
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
