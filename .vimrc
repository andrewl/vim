call pathogen#infect()

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set t_Co=256
set background=dark
colors solarized

filetype on

if has("autocmd")
"  Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=drupal.php.php
    autocmd BufRead,BufNewFile *.profile set filetype=drupal.php
    autocmd BufRead,BufNewFile *.theme set filetype=drupal.php
    autocmd BufRead,BufNewFile *.install set filetype=drupal.php
    autocmd BufRead,BufNewFile *.inc set filetype=drupal.php
    autocmd BufRead,BufNewFile *.view set filetype=drupal.php
  augroup END
endif

syntax on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"Display and Format the status line
set laststatus=2
set statusline=%t%m%=%c,%l/%L

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
nmap <leader>f :TlistToggle<cr>

" ctags file  - @todo make this a project basis file
set tags=/srv/eurostar/htdocs/profiles/eurostar/modules/custom/tags

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Fast saving
nmap <leader>w :w!<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" start ctrip with ctrl+t
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'

" php documentor settings
let g:pdv_cfg_Author = "Andrew Larcombe <andrew@andrewl.net>"
let g:pdv_cfg_Copyright = ""
let g:pdv_cfg_License = ""
nmap <leader>d :exe PhpDoc()<cr>


" show relative numbers on navigation
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
