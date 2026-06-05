if status is-interactive
    # Commands to run in interactive sessions can go here
end

function code
    # Si no pasás argumentos o le pasás un punto, usa la ruta absoluta actual ($PWD)
    if test (count $argv) -eq 0; or contains "." $argv
        command code-oss $PWD >/dev/null 2>&1 &
        disown
        exit
    else
        # Si le pasás un archivo específico (ej: code archivo.txt), lo abre sin cerrar la terminal
        command code-oss $argv >/dev/null 2>&1 &
        disown
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

# Función para que Yazi cambie el directorio de Fish al salir
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Alias basicos

alias hx="helix"
set -gx EDITOR helix

# Atajos rápidos para Git (Para no escribir tanto comando largo)
alias gst="git status"
alias gadd="git add ."
alias gcm="git commit -m"
alias gpush="git push"

