" Status line
  set ruler         " show row/col and % of file
  set showcmd       " show incomplete commands

" Line numbers
  set number          " turn line numbers on
  set numberwidth=5   " set width allocated for line numbers

" Searching
  set hlsearch                " highlight the last-searched pattern
  set ignorecase              " ignore case, except...
  set smartcase               " uppercase searches are case sensitive
  nnoremap <CR> :noh<CR><CR>  " clear highlighting with return

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

" Colors
  set background=dark
  syntax on  " turn on syntax highlighting
  colorscheme desert

" Misc.
  " Disable the arrow keys in command mode (a good habit).
  map <up> <nop>
  map <down> <nop>
  map <left> <nop>
  map <right> <nop>

  " fix annoying line-skipping behavior on long lines
  nnoremap j gj
  nnoremap k gk

  " Show trailing whitepace and spaces before a tab:
  :autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" crosshair-style selection--useful for e.g. CSV
" set cursorline
" set cursorcolumn

" set colorcolumn=80  " Note the 80-character terminal width
