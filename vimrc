set nocompatible

set modelines=0

" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Fancy things in 7.3

set title
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
" set relativenumber
" set undofile  Enable 7.3 undo in saved files

set statusline=%F%m%r%h%w[%L]%y[%p%%][%04v] "[%{fugitive#statusline()}]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the rbuffer
"}

" <leader> key
let mapleader = ","

" Searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
" nnoremap <tab> %
" vnoremap <tab> %

:nmap <Space> /

" Handle long lines correctly
set wrap
" set textwidth=80
set formatoptions=n
" set colorcolumn=80
" set tw=80

" Show invisible characters
" set list
" set listchars=tab:▸\ ,eol:¬

" Move around lines
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" inoremap <Esc> <nop>

nnoremap j gj
nnoremap k gk

" Map ESC
imap jj <ESC>
nnoremap ; :

" ACK
" Use Ack instead of grep
set grepprg=ack

" ,a to Ack
nnoremap <leader>a :Ack

" Rotating among results in an ack search
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" TComment
map <Leader>/ :TComment<CR>

" Reselect text that was just pasted to perform further commands on it
" nnoremap <leader>v V`]

" Splits  ,v to open a new vertical split and switch to it
nnoremap <leader>v <C-w>v<C-w>l
" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
nmap <leader>d :bd<CR>
nmap <leader>D :bufdo bd<CR>

" Saving and buffer stuff
" :wqa! Quit saving
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>


" Set the tag file search order
" set tags=./tags;
" let Tlist_WinWidth = 60
" " Use only current file to autocomplete from tags
" set complete=.,t

" DO NOT Use _ as a word-separator
" set iskeyword-=_

" EXTERNAL COPY / PASTE "
set pastetoggle=<F2>
"    paste:   "+gP
"    copy:    "+y

" PLUGINS "

" Load all bundles in .vim/bundles
call pathogen#runtime_append_all_bundles()

" NERDTree
" let NERDTreeShowBookmarks = 1
" let NERDChristmasTree = 1
" let NERDTreeWinPos = "left"
" let NERDTreeHijackNetrw = 1
" let NERDTreeQuitOnOpen = 1
" let NERDTreeWinSize = 50
" map <leader>p :NERDTreeToggle<cr>
"
" PeepOpen
map <leader>o <Plug>PeepOpen

" Buffer window
nmap <silent> <leader>b :FufBuffer<CR>

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" Execute current buffer as ruby
map <S-r> :w !ruby<CR>

let my_home = expand("$HOME/")

set t_Co=256
" colorscheme af
" colorscheme oceanblack
" colorscheme skittles_dark
" colorscheme twilight
" colorscheme mustang
" colorscheme clouds_midnight
" colorscheme molokai

" GUI "
if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA
  set mouse=v
  set guifont=Menlo:h14 "<- Maybe a good idea when using mac
  colorscheme railscasts
else
  colorscheme wombat256
endif

set guifont=Menlo:h14

set nobackup
set nowritebackup
set noswapfile
syntax on

" BLAAAME
vmap <Leader>gb :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p<CR>

" Tabularize
if exists(":Tab")
  nmap <leader>a\| :Tab /\|<CR>
  vmap <leader>a\| :Tab /\|<CR>
  nmap <leader>a= :Tab /=<CR>
  vmap <leader>a= :Tab /=<CR>
  nmap <leader>a: :Tab /:\zs<CR>
  vmap <leader>a: :Tab /:\zs<CR>
endif

" Press F5 to toggle GUndo tree
"nnoremap <F5> :GundoToggle<CR>

" Essentials
filetype off
filetype plugin indent on

" Finally, load custom configs
if filereadable(my_home . '.vimrc.local')
  source ~/.vimrc.local
endif

" Autocompile Coffeescript files on save
autocmd BufWritePost,FileWritePost *.coffee :silent !coffee -c <afile>

" Autodelte trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
"
" While editing a Markdown document in Vim, preview it in the
" default browser.
"
" Author: Nate Silva
"
" To install: Place markdown.vim in ~/.vim/ftplugin or
" %USERPROFILE%\vimfiles\ftplugin.
"
" To use: While editing a Markdown file, press ',p' (comma p)
"
" Tested on Windows and Mac OS X. Should work on Linux if you set
" BROWSER_COMMAND properly.
"
" Requires the `markdown` command to be on the system path. If you
" do not have the `markdown` command, install one of the following:
"
" http://www.pell.portland.or.us/~orc/Code/discount/
" http://www.freewisdom.org/projects/python-markdown/
"
function!PreviewMarkdown()
    " **************************************************************
    " Configurable settings

    let MARKDOWN_COMMAND = 'markdown'

    if has('win32')
        " note important extra pair of double-quotes
        let BROWSER_COMMAND = 'cmd.exe /c start ""'
    else
        let BROWSER_COMMAND = 'open'
    endif

    " End of configurable settings
    " **************************************************************

    silent update
    let output_name = tempname() . '.html'

    " Some Markdown implementations, especially the Python one,
    " work best with UTF-8. If our buffer is not in UTF-8, convert
    " it before running Markdown, then convert it back.
    let original_encoding = &fileencoding
    let original_bomb = &bomb
    if original_encoding != 'utf-8' || original_bomb == 1
        set nobomb
        set fileencoding=utf-8
        silent update
    endif

    " Write the HTML header. Do a CSS reset, followed by setting up
    " some basic styles from YUI, so the output looks nice.
    let file_header = ['<html>', '<head>',
        \ '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">',
        \ '<title>Markdown Preview</title>',
        \ '<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.3.0/build/cssreset/reset-min.css">',
        \ '<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.3.0/build/cssbase/base-min.css">',
        \ '<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.3.0/build/cssfonts/fonts-min.css">',
        \ '<style>body{padding:20px;}div#container{background-color:#F2F2F2;padding:0 20px;margin:0px;border:solid #D0D0D0 1px;}</style>',
        \ '</head>', '<body>', '<div id="container">']
    call writefile(file_header, output_name)

    let md_command = '!' . MARKDOWN_COMMAND . ' "' . expand('%:p') . '" >> "' .
        \ output_name . '"'
    silent exec md_command

    if has('win32')
        let footer_name = tempname()
        call writefile(['</div></body></html>'], footer_name)
        silent exec '!type "' . footer_name . '" >> "' . output_name . '"'
        exec delete(footer_name)
    else
        silent exec '!echo "</div></body></html>" >> "' .
            \ output_name . '"'
    endif

    " If we changed the encoding, change it back.
    if original_encoding != 'utf-8' || original_bomb == 1
        if original_bomb == 1
            set bomb
        endif
        silent exec 'set fileencoding=' . original_encoding
        silent update
    endif

    silent exec '!' . BROWSER_COMMAND . ' "' . output_name . '"'

    exec input('Press ENTER to continue...')
    echo
    exec delete(output_name)
endfunction

" Map this feature to the key sequence ',p' (comma lowercase-p)
map <F8> :call PreviewMarkdown()<CR>

" Settings for VimClojure
" let vimclojure#HighlightBuiltins = 1 " Highlight Clojure's builtins
" let vimclojure#ParenRainbow = 1      " Rainbow parentheses'!

" Settings for RVM
set shell=bash
