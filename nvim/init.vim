" Plugins
  call plug#begin('$XDG_CONFIG_HOME/vim/plugged')

  Plug 'bling/vim-airline'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'scrooloose/syntastic'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'jmcantrell/vim-virtualenv'

  " Add plugins to &runtimepath
  call plug#end()

  " virtualenv support
  let g:virtualenv_auto_activate = 1

  " vim-better-whitespace HACK: necessary because bug
  autocmd VimEnter * DisableWhitespace
  " autocmd VimEnter * EnableWhitespace  " turn off for now
  autocmd BufWritePre * StripWhitespace  " eliminate whitespace on save

" vim-airline customizations
  " theme
  source $XDG_CONFIG_HOME/theme/vim-airline/savanna.vim
  let g:airline_theme='savanna'

  " tabline
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1

  " branch
  let g:airline#extensions#branch#enabled = 1

  " syntastic
  let g:airline#extensions#syntastic#enabled = 1

" syntastic customizations
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

" TODO obviated by airline
" Status line
  set ruler         " show row/col and % of file
  set showcmd       " show incomplete commands

" Line numbers
  set relativenumber  " show line number relative to the current line
  set number          " turn line numbers on
  set numberwidth=1

" Searching
  set hlsearch                " highlight the last-searched pattern
  set ignorecase              " ignore case, except...
  set smartcase               " uppercase searches are case sensitive
  " clear highlighting with return
  nnoremap <CR> :noh<CR><CR>

" Tabbing
  set expandtab " use spaces whenever tab is hit
  set shiftwidth=2 " sets width of indentation (autoindent)

" Folding
  set foldmethod=manual

  " fold with space
  nnoremap <space> za
  vnoremap <space> zf

" Vim tabs!
  nnoremap th  :tabfirst<CR>
  nnoremap tj  :tabprev<CR>
  nnoremap tk  :tabnext<CR>
  nnoremap tl  :tablast<CR>
  nnoremap tn  :tabnew<Space>
  nnoremap tm  :tabm<Space>
  nnoremap td  :tabclose<CR>

" Clipboard support
  set clipboard+=unnamedplus

" Colors
  let base16colorspace=256  " Access colors present in 256 colorspace
                            " (only use with base16-shell modification
                            " to 256 colorspace)
  set background=dark
  syntax on  " turn on syntax highlighting
  let &rtp.=','.$XDG_CONFIG_HOME.'/theme/vim'
  colorscheme base16-ateliersavanna

" Window navigation
  nnoremap <C-h> <C-w><C-h>
  nnoremap <C-j> <C-w><C-j>
  nnoremap <C-k> <C-w><C-k>
  nnoremap <C-l> <C-w><C-l>

" Misc.
  " Disable the arrow keys in command mode (a good habit).
  map <up> <nop>
  map <down> <nop>
  map <left> <nop>
  map <right> <nop>

  " fix annoying line-skipping behavior on long lines
  nnoremap j gj
  nnoremap k gk

  " whitespace
    " it's always annoying in these files
    autocmd FileType c,py,java autocmd BufWritePre <buffer> :%s/\s\+$//e

    " otherwise, we define
    command! -bar FixWhitespace %s/\s\+$//

  " Neovim's matchit is broken right now; turn it off.
  let loaded_matchit = 1

" crosshair-style selection--useful for e.g. CSV
" set cursorline
" set cursorcolumn

" set colorcolumn=80  " Note the 80-character terminal width
