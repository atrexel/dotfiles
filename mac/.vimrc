" Mac System .vimrc configuration file

" Enable syntax color
:let python_highlight_all=1
:syntax on

" Set colorscheme
set background=dark
let &t_Co=256
"note: set iTerm2 Presets -> iTerm2 > Preferences > Profiles > Colors &&
"set Color-Presets "Solarized Dark" option
:colorscheme solarized
if $TERM == "xterm-256color"
  set t_Co=256
endif

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure


"""""""""""""""""""""""""""
" SET WORKING ENVIRONMENT "
"""""""""""""""""""""""""""
" Set encoding
:set encoding=utf-8
" Enable line numbers
:set number
" Highlight current line
:set cursorline
" Show the cursor position
:set ruler
" Always show status line
:set laststatus=2
" Respect modeline in files
:set modeline
:set modelines=4
" Don’t reset cursor to start of line when moving around.
:set nostartofline
" Don’t show the intro message when starting Vim
:set shortmess=atI
" Show the current mode
:set showmode
" Show the filename in the window titlebar
:set title
" Show the (partial) command as it’s being typed
:set showcmd
" Try to speed up line navigation
:set ttyfast
" Buffer screen updates instead of updating all the time
":set lazyredraw

" Use visual bell to turn off audio bell
":set visualbell
" Clear the visual bell length to deactivate flashing
":set t_vb=
" Disable error bells
set noerrorbells

set viminfo+=! " make sure vim history works
map <C-J> <C-W>j<C-W>_ " open and maximize the split below
map <C-K> <C-W>k<C-W>_ " open and maximize the split above
set wmh=0 " reduces splits to a single line

" Centralize backups, swapfiles and undo history
"set backupdir=~/.vim/backups
"set directory=~/.vim/swaps
"if exists("&undodir")
"        set undodir=~/.vim/undo
"endif


""""""""""""""""""""""
" Set Mouse Handling "
""""""""""""""""""""""
" Enable mouse in all modes
"set mouse=a
set mouse=r
"set mouse=v


"""""""""""""""""""""""""""""""""""
" Set Command and Search Settings "
"""""""""""""""""""""""""""""""""""
" Enhance command-line completion
set wildmenu
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch


""""""""""""""""""""""""""
" Set Character Handling "
""""""""""""""""""""""""""
" Allow backspace in insert mode
set backspace=indent,eol,start
" Allow cursor keys in insert mode
set esckeys
" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set lcs=tab:▸-,trail:␠,eol:⏎,nbsp:⎵
set lcs=tab:▸\ ,trail:·,nbsp:⎵
set list
" Highlight trailing spaces red
let w:m2=matchadd('ErrorMsg', '\s\+$', -1)
" Auto indent when working
set autoindent
" Make tabs as wide as four spaces
set tabstop=4
" Turn tabs into spaces
set shiftwidth=4
set softtabstop=4
set expandtab


"""""""""""""""""""""
" Set Line Behavior "
"""""""""""""""""""""
" Wrap long lines
set wrap
set textwidth=79
set formatoptions=qrn1
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Don’t add empty newlines at the end of files
set binary
set noeol

" Set color column at 80 characters
set colorcolumn=80
hi ColorColumn ctermbg=Black ctermfg=Red guibg=gray14
" Add highlighting to text beyond the color column
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(81,999),",")
let &colorcolumn="80,".join(range(100,101),",")
let &colorcolumn=&colorcolumn.join(range(120,999),",")
" Highlight characters beyond 100 characters
"let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

" Strip trailing whitespace (,ss)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Honor markdown file types
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" Automatic commands
if has("autocmd")
        " Enable file type detection
        filetype on
        " Treat .json files as .js
        autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

