" Basic config
set mouse=a
set nocompatible
set clipboard=unnamedplus
set t_Co=256
set laststatus=2

" Seteo de tecla Lider
let mapleader=" "

" Plugins
" call plug#begin()

" List your plugins here
" Plug 'vim-airline/vim-airline'
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
" Plug 'sheerun/vim-polyglot'
" A
" call plug#end()

function! ToggleExplorer()
  " Verifica si el explorador de archivos está abierto
  if exists("t:netrw_buf") && bufwinnr(t:netrw_buf) != -1
    " Cierra el explorador de archivos
    execute 'bd ' . t:netrw_buf
    unlet t:netrw_buf
  else
    " Abre el explorador de archivos y guarda el buffer ID
    Lexplore!
    let t:netrw_buf = bufnr("%")
  endif
endfunction

" Abrir o cerrar la terminal con Ctrl + /

function! ToggleTerminal()
  if exists("t:term_buf") && bufexists(t:term_buf)
    " Si la terminal está abierta, ciérrala
    exec 'bdelete! ' . t:term_buf
    unlet t:term_buf
  else
    " Si la terminal no está abierta, ábrela en una nueva ventana
    split
    resize 10
    terminal
    let t:term_buf = bufnr('%')
  endif
endfunction

let g:netrw_banner = 0
let g:netrw_liststyle = 3

let g:netrw_winsize = 20


nnoremap <Leader>t :terminal<CR>
nnoremap <Leader>e :call ToggleExplorer()<cr>
nnoremap <Leader>l :Lex<cr>
nnoremap <Esc><Esc> :nohlsearch<CR>

" Activar números de línea relativos
set relativenumber
set number


" Establecer el esquema de color
" colorscheme xoria256
" colorscheme blacksea
" colorscheme oceanblack
" colorscheme blacksea
" colorscheme railscasts
" colorscheme asu1dark
" colorscheme bluegreen
" colorscheme brookstream
" colorscheme calmar256-dark
" colorscheme candy
" colorscheme candycode
" colorscheme darkbone
" colorscheme desert256
" colorscheme dw_cyan green orange purple yellow red blue
" colorscheme jellybeans
" colorscheme matrix
" colorscheme rootwater
" colorscheme tir_black
colorscheme tango
" set termguicolors
" highlight Normal guibg=none
" highlight NormalFloat guibg=none
" highlight NonText guibg=none

" Configuración de identación
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

" Mostrar la línea de comando mientras se digita un comando incompleto
" set showcmd

" Resaltar la búsqueda
set hlsearch

" Ignorar el caso en las búsquedas
set ignorecase

" Hacer la búsqueda sensible al caso si contiene mayúsculas
set smartcase

" Deshabilitar los sonidos de error
set noerrorbells
set novisualbell

" Habilitar el portapapeles del sistema
set clipboard=unnamedplus

" Establecer tiempo de espera para secuencias de teclas
set timeoutlen=500

" Permite wrapping
set wrap

" Display de las opciones de completion como menu
set wildmenu

" Mejor manejo de la copia y pega entre vim y otras aplicaciones
set pastetoggle=<F2>

" Mejor manejo de la deshacer
set undofile

" Mostrar el número de línea y columna en la barra de estado
set ruler

" Activar el modo de línea de comando en tiempo real
" set inccommand=split

" Establecer el tamaño de las ventanas divididas
set equalalways
set splitright
set splitbelow

" Mejorar la experiencia de búsqueda
" set incsearch

" Activar el soporte para archivos
filetype plugin on
filetype indent on

" Mejorar el plegado de código
set foldmethod=syntax
set foldlevelstart=99

" Configuración para archivos Python
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Otras configuraciones
set mouse=a  " Activar el soporte del ratón
set scrolloff=8  " Mantener 8 líneas visibles por encima y por debajo del cursor
set signcolumn=no  " No mostrar la columna de signo


