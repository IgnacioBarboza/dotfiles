-- ==========================================
-- 1. CONFIGURACIONES BASE (Estilo Helix)
-- ==========================================
local opt = vim.opt

opt.number = true           -- Mostrar números de línea
opt.relativenumber = false   -- Números relativos (como en tu Helix)
opt.cursorline = true       -- Resaltar la línea actual
opt.termguicolors = true    -- Habilitar colores verdaderos (necesario para temas como Nord)
opt.clipboard = "unnamedplus" -- Sincronizar con el portapapeles del sistema

-- Magia pura: Esto permite usar Shift + Flechas para seleccionar texto nativamente,
-- comportándose exactamente igual que en editores clásicos sin complicar los modos de Neovim.
opt.keymodel = "startsel,stopsel"
-- --- CURSOR ORIGINAL ---
-- Al dejarlo vacío, Neovim no cambia la forma y respeta el "beam" de Kitty en todo momento
opt.guicursor = ""
-- ==========================================
-- 2. ATAJOS DE TECLADO PERSONALIZADOS
-- ==========================================
local map = vim.keymap.set

-- Desactivar la barra espaciadora y usarla como "Tecla Líder" (muy útil a futuro)
vim.g.mapleader = " "

-- --- Moverse por palabras (Ctrl + Flechas) ---
-- Modo Normal
map('n', '<C-Right>', 'w', { desc = "Siguiente palabra" })
map('n', '<C-Left>', 'b', { desc = "Palabra anterior" })
-- Modo Inserción (Usamos <C-o> para ejecutar un comando normal sin salir de inserción)
map('i', '<C-Right>', '<C-o>w', { desc = "Siguiente palabra" })
map('i', '<C-Left>', '<C-o>b', { desc = "Palabra anterior" })
-- Modo Visual
map('v', '<C-Right>', 'w', { desc = "Siguiente palabra" })
map('v', '<C-Left>', 'b', { desc = "Palabra anterior" })

-- --- Copiar, Pegar y Cortar estilo clásico ---
-- Nota: Para que esto funcione perfectamente en tu entorno, asegúrate de tener
-- instalado el paquete `wl-clipboard`, que es el gestor para Wayland.
map('v', '<C-c>', '"+y', { desc = "Copiar selección" })
map('n', '<C-v>', '"+p', { desc = "Pegar" })
map('i', '<C-v>', '<C-r>+', { desc = "Pegar en modo inserción" })
map('v', '<C-v>', '"+p', { desc = "Pegar sobre selección" })
map('v', '<C-x>', '"+x', { desc = "Cortar selección" })

-- --- Duplicar línea (Ctrl + D) ---
map('n', '<C-d>', 'yyp', { desc = "Duplicar línea abajo" })
map('v', '<C-d>', 'y`>p', { desc = "Duplicar bloque visual" })

-- ESTA ES LA LÍNEA CORREGIDA:
map('i', '<C-d>', '<Esc>yypi', { desc = "Duplicar línea abajo y seguir editando" })-- --- Guardar y Salir rápido ---
map('n', '<C-s>', ':w<CR>', { desc = "Guardar archivo" })
map('i', '<C-s>', '<Esc>:w<CR>a', { desc = "Guardar en inserción" })
map('n', '<C-q>', ':q<CR>', { desc = "Salir" })


-- ==========================================
-- 3. COMPORTAMIENTO Y SELECCIÓN AVANZADA
-- ==========================================
-- --- Marcar texto por palabra (Shift + Control + Flechas) ---
-- Usamos los códigos de escape \e[1;6C (Derecha) y \e[1;6D (Izquierda)

-- En modo normal
map('n', '<Esc>[1;6C', 've', { desc = "Marcar palabra siguiente" })
map('n', '<Esc>[1;6D', 'vb', { desc = "Marcar palabra anterior" })

-- En modo visual
map('v', '<Esc>[1;6C', 'e', { desc = "Extender marca palabra siguiente" })
map('v', '<Esc>[1;6D', 'b', { desc = "Extender marca palabra anterior" })

-- En modo inserción
map('i', '<Esc>[1;6C', '<C-o>ve', { desc = "Marcar palabra siguiente" })
map('i', '<Esc>[1;6D', '<C-o>vb', { desc = "Marcar palabra anterior" })

-- En modo inserción: salta rápidamente a modo visual y marca la palabra
map('i', '<C-S-Right>', '<C-o>ve', { desc = "Marcar palabra siguiente" })
map('i', '<C-S-Left>', '<C-o>vb', { desc = "Marcar palabra anterior" })


-- --- Comportamiento lógico de las teclas de borrado ---
-- Usamos '"_c' (Change) en lugar de '"_d' (Delete). 
-- Esto borra la selección sin pisar el portapapeles y te deja directamente en modo Inserción.
map('v', '<BS>', '"_c', { desc = "Borrar selección y seguir en Inserción" })
map('v', '<Del>', '"_c', { desc = "Borrar selección y seguir en Inserción" })

-- ==========================================
-- 4. SELECCIÓN TOTAL Y MARCADOS INTELIGENTES
-- ==========================================

-- --- Control + A (Seleccionar todo el archivo) ---
map('n', '<C-a>', 'ggVG', { desc = "Seleccionar todo" })
map('i', '<C-a>', '<Esc>ggVG', { desc = "Seleccionar todo" })
map('v', '<C-a>', '<Esc>ggVG', { desc = "Seleccionar todo" })

-- --- Control + Shift + Arriba / Abajo (Lógica Inteligente) ---
-- Códigos de terminal para Ctrl+Shift+Arriba (\e[1;6A) y Abajo (\e[1;6B)

-- Modo Visual (Si ya estás marcando texto y quieres seguir extendiendo)
map('v', '<Esc>[1;6B', function()
    if vim.fn.line('.') == vim.fn.line('$') then return '$' else return 'j' end
end, { expr = true, desc = "Extender marca abajo inteligente" })

map('v', '<Esc>[1;6A', function()
    if vim.fn.line('.') == 1 then return '0' else return 'k' end
end, { expr = true, desc = "Extender marca arriba inteligente" })

-- Modo Normal (Para empezar a marcar desde cero)
map('n', '<Esc>[1;6B', function()
    if vim.fn.line('.') == vim.fn.line('$') then return 'v$' else return 'vj' end
end, { expr = true, desc = "Iniciar marca abajo inteligente" })

map('n', '<Esc>[1;6A', function()
    if vim.fn.line('.') == 1 then return 'v0' else return 'vk' end
end, { expr = true, desc = "Iniciar marca arriba inteligente" })

-- Modo Inserción (Para empezar a marcar directamente mientras escribes)
map('i', '<Esc>[1;6B', function()
    if vim.fn.line('.') == vim.fn.line('$') then return '<Esc>v$' else return '<Esc>vj' end
end, { expr = true, desc = "Iniciar marca abajo inteligente" })

map('i', '<Esc>[1;6A', function()
    if vim.fn.line('.') == 1 then return '<Esc>v0' else return '<Esc>vk' end
end, { expr = true, desc = "Iniciar marca arriba inteligente" })


-- ==========================================
-- 5. MODO NORMAL "SÓLO LECTURA Y NAVEGACIÓN"
-- ==========================================

-- Lista de teclas clásicas de edición de Vim que vamos a bloquear en modo normal
local teclas_bloqueadas = {
    "x", "X", -- Borrar un solo carácter
    "d", "D", -- Borrar líneas o hasta el final (bloquea 'dd', 'dw', etc.)
    "c", "C", -- Cambiar texto (bloquea 'cc', 'cw')
    "s", "S", -- Sustituir texto
    "r", "R", -- Reemplazar un carácter
    "p", "P", -- Pegar estilo Vim (ya usas Ctrl+V)
    "J",      -- Unir líneas
    "~"       -- Cambiar entre mayúscula y minúscula
}

-- Bucle mágico: asigna <Nop> (No Operation) a cada una de esas teclas
for _, tecla in ipairs(teclas_bloqueadas) do
    map('n', tecla, '<Nop>', { desc = "Bloqueado para evitar edición accidental" })
end

-- ==========================================
-- 6. BORRADO RÁPIDO DE PALABRAS
-- ==========================================

-- --- Control + Retroceso (Borrar palabra hacia atrás) ---
-- En Neovim, <C-w> ya hace esto nativamente en modo inserción, 
-- así que simplemente atamos el Ctrl+Backspace a esa función.
map('i', '<C-BS>', '<C-w>', { desc = "Borrar palabra anterior" })

-- --- Control + Suprimir (Borrar palabra hacia adelante) ---
-- Usamos <Cmd>normal! para ejecutar el comando interno de Vim ("_dw)
-- sin que se vea afectado por el bloqueo que le pusimos a la tecla 'd'.
map('i', '<C-Del>', '<Cmd>normal! "_dw<CR>', { desc = "Borrar palabra siguiente" })
