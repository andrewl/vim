call pathogen#infect()

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set t_Co=256
set background=dark
colors solarized

filetype plugin on
filetype on

if has("autocmd")
"  Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php.drupal
    autocmd BufRead,BufNewFile *.profile set filetype=php.drupal
    autocmd BufRead,BufNewFile *.theme set filetype=php.drupal
    autocmd BufRead,BufNewFile *.install set filetype=php.drupal
    autocmd BufRead,BufNewFile *.inc set filetype=php.drupal
    autocmd BufRead,BufNewFile *.view set filetype=php.drupal
    autocmd BufRead,BufNewFile *.test set filetype=php.drupal
  augroup END
endif

"cucumber files
let feature_filetype='behat'

" yes, we like syntax highlighting
syntax on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"Display and Format the status line
set laststatus=2
set statusline=%{fugitive#statusline()}%t%m%=%c,%l/%L

let Tlist_Ctags_Cmd = "~/bin/ctags"
let Tlist_WinWidth = 50

" Makes search act like search in modern browsers
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=3

" Fast saving
nmap <leader>w :w!<cr>

" Git shortcuts
nmap <leader>gd :Gdiff<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>gc :Gcommit<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" start ctrlp with ctrl+t
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_follow_symlinks = 1
map <leader>f :CtrlPTag<CR>
map <leader>] :cs find c <C-R>=expand("<cword>")<CR><CR>  

" initiate dash on <leader>d
:nmap <silent> <leader>d <Plug>DashSearch

" php documentor settings
let g:pdv_cfg_Author = "Andrew Larcombe <andrew@andrewl.net>"
let g:pdv_cfg_Copyright = ""
let g:pdv_cfg_License = ""
nmap <leader>D :exe PhpDoc()<cr>



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
set relativenumber


let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_conf="--standard=DrupalPractice --extensions=php,inc,module,install,theme,profile"

" project specific lvimrc files
let g:localvimrc_sandbox = 0
let g:localvimrc_count = 1
let g:localvimrc_ask = 0

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


let g:neocomplete#enable_auto_select = 1

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
autocmd FileType php.drupal setlocal omnifunc=phpcomplete_extended#CompletePHP

