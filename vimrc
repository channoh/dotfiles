" vim: noexpandtab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Vundle
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" Syntax and indentation for JavaScript
Plugin 'pangloss/vim-javascript'

"" Syntax and indentation for Scala
Plugin 'derekwyatt/vim-scala'

"" Syntax and indentation for Dockerfile
Plugin 'ekalinin/dockerfile.vim'

"" Insert or delete brackets, parens, quotes in pair
Plugin 'jiangmiao/auto-pairs'
let g:AutoPairsShortcutJump='<C-n>'
let g:AutoPairsShortcutBackInsert='<C-b>'

"" Display thin vertical lines at each indentation level
Plugin 'Yggdroot/indentLine'
let g:indentLine_enabled=1
let g:indentLine_char="|"		" | ¦ ┆ ┊ │
let g:indentLine_color_term=239

"" File system explorer
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

"" Browse the tags of the current file
Plugin 'majutsushi/tagbar'
let g:tagbar_left=0

"" Increase and decrease number or letters sequence via visual mode
Plugin 'triglav/vim-visual-increment'

"" Show difference between two directories using vimdiff
Plugin 'will133/vim-dirdiff'
let g:DirDiffExcludes = ".svn,tags,*.pyc,*.o,*.a"
let g:DirDiffAddArgs = "-w --ignore-all-space"

"" Status line
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts=1
let g:airline_theme='base16_bright'

"" Easily align text
Plugin 'godlygeek/tabular'

"" for markdown
"" dependency: godlygeek/tabular
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 1

"" Comment functions
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCustomDelimiters = { 'c':           { 'left':  '//','right':  '' },
							\  'cpp':         { 'left':  '//','right':  '' },
							\  'verilog':     { 'left':  '//','right':  '' },
							\  'php':         { 'left':  '//','right':  '' },
							\  'javascript':  { 'left':  '//','right':  '' },
							\  'idl':         { 'left':  '//','right':  '' },
							\  'opencl':      { 'left':  '//','right':  '' },
							\  'css':         { 'left':  '//','right':  '' },
							\  'scala':       { 'left':  '//','right':  '' },
							\  'cuda':        { 'left':  '//','right':  '' },
							\  'asm':         { 'left':  '#', 'right':  '' },
							\  'sh':          { 'left':  '#', 'right':  '' },
							\  'python':      { 'left':  '#', 'right':  '' },
							\  'bash':        { 'left':  '#', 'right':  '' },
							\  'ruby':        { 'left':  '%', 'right':  '' },
							\  'tex':         { 'left':  '%', 'right':  '' },
							\  'bib':         { 'left':  '%', 'right':  '' },
							\  'vim':         { 'left':  '"', 'right':  '' },
							\  'ini':         { 'left':  ';', 'right':  '' },
							\  'llvm':        { 'left':  ';', 'right':  '' },
							\  'lua':         { 'left':  '--','right':  '' }
							\ }
let g:NERDCommentEmptyLines = 0
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

"" incrementally highlights ALL pattern matches
Plugin 'haya14busa/incsearch.vim'

"" Fency start screen
Plugin 'mhinz/vim-startify'

"" Syntax range (for Gem5)
Plugin 'vim-scripts/SyntaxRange'

call vundle#end()	" required
filetype plugin indent on	" required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Filetype
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup Filetype
	au!
	au BufRead,BufNewFile	*{Makefile,makefile}*		set filetype=make
	au BufRead,BufNewFile	*.{ll,bc}					set filetype=llvm
	au BufRead,BufNewFile	*.td						set filetype=tablegen
	au BufRead,BufNewFile	*.rst						set filetype=rest
	au BufRead,BufNewFile	*.html						set filetype=html
	au BufRead,BufNewFile	*.tex						set filetype=tex
	au BufRead,BufNewFile	*.md						set filetype=markdown
	au BufRead,BufNewFile	*.{gnuplot,gp}				set filetype=gnuplot
	" au BufRead,BufNewFile config                    set filetype=config
	au BufRead,BufNewFile	*.cl						set filetype=opencl
	au BufRead,BufNewFile	*.{dat,data,csv}			set filetype=csv
	au BufRead,BufNewFile	*.gdb						set filetype=gdb
	au BufRead,BufNewFile	*.python					set filetype=python
	au BufRead,BufNewFile	*.bb						set filetype=sh
	au BufRead,BufNewFile	*.bbclass					set filetype=python
	au BufRead,BufNewFile	*.cuh   					set filetype=cuda
	au BufRead,BufNewFile	*.isa						set filetype=cpp
		\ | exec ":call SyntaxRange#Include('^def', '}}', 'python')"
	au BufRead,BufNewFile	*.{patch,diff}				set filetype=diff
		\ | set noexpandtab
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Basic
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" remember previous line
au BufRead *
	\ if &filetype != 'svn' && line("'\"") > 0 && line("'\"") <= line("$") |
	\    exe "norm g'\"" |
	\ endif

set encoding=utf-8
set fencs=utf-8,euc-kr,utf-16le
set fileencoding=utf-8

"" Space
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set smarttab
set expandtab

set backspace=indent,eol,start
set number
set cursorline

"" Searching
set hlsearch		" highlight matched
set incsearch		" incremental searching
set ignorecase		" searches are case insensitive
set smartcase
set fdo-=search		" search only in open folds (unfolded text)

set mouse=a
set laststatus=2
" set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P

set title
set showcmd
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set path+=**

set nobackup
set noswapfile

set clipboard=unnamed
" set clipboard=exclude:.*
" set clipboard=unnamed,unnamedplus

set sol
set mps+=<:>
set showmatch
" set autoindent
" set smartindent

"" check the current folder for tags file
"" and keep going one directory up all the way to $HOME
set tags+=./tags;$HOME

"" diff ignore white space
if &diff
	set diffopt+=iwhite
endif

"" tmux knows the extended mouse mode
if $TMUX != ""
	set ttymouse=xterm2
endif

"" Make command with -j4 option
let &makeprg = 'make -j4'

"" automatically open the location/quickfix window after :make, :grep, :lvimgrep
augroup quickOpen
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END

syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Colorscheme and keyword
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
colorscheme molokai
hi SpecialKey       ctermfg=239
hi Statement        ctermfg=161                     cterm=bold
hi StatusLine       ctermfg=233     ctermbg=251     cterm=none
hi StatusLineNC     ctermfg=234     ctermbg=251
hi Visual                           ctermbg=237     cterm=none
hi Normal           ctermfg=15      ctermbg=232
hi Comment          ctermfg=244
hi CursorLine                       ctermbg=237     cterm=none
hi CursorLineNr     ctermfg=9       ctermbg=237     cterm=bold
hi LineNr           ctermfg=250     ctermbg=232
hi NonText          ctermfg=250     ctermbg=232
hi ColorColumn                                      ctermbg=234
hi DiffAdd                                          ctermbg=22
hi clear DiffChange
hi DiffDelete       ctermfg=124     ctermbg=232
hi DiffText                         ctermbg=124     cterm=none

"" Add keywords
augroup myTodo
  autocmd!
  autocmd Syntax * syn keyword cTodo NOTE ARCL CN containedin=.*Comment contained
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Shortcuts
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let mapleader="`"
noremap  <silent> <Tab><Tab>    <C-w><C-w>
noremap  <silent> <Tab><Left>   <C-w><Left>
noremap  <silent> <Tab><Right>  <C-w><Right>
noremap  <silent> <Tab><Up> 	<C-w><Up>
noremap  <silent> <Tab><Down>	<C-w><Down>
noremap  <silent> <Tab>h        <C-w><Left>
noremap  <silent> <Tab>l        <C-w><Right>
noremap  <silent> <Tab>j        <C-w><Up>
noremap  <silent> <Tab>k        <C-w><Down>
noremap  <silent> <leader>t     :TagbarToggle<CR>
noremap  <silent> <leader>e     :NERDTreeToggle<CR>
noremap  <silent> <leader>c     :call CopyToggle()<CR>
noremap	 <silent> <Leader>z		:call MaximizeToggle()<CR>

map		<leader>\	<plug>NERDCommenterInvert
map		/			<Plug>(incsearch-forward)
map		?			<Plug>(incsearch-backward)
map		g/			<Plug>(incsearch-stay)

command! E				Explore
command! Trim           :%s/\s\+$//
command! ToHtml         :call ToHtml()
" command! CSVAlign       :call AlignCSV()
" command! CommentToggle  :call CommentToggle()
command! W              :w
command! Wq             :wq
command! Wqa            :wqa
command! Q              :q
command! Qa             :qa
command! InsertHeader   :call InsertHeader()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToHtml()
	let g:html_font='Consolas'
	exe ':IndentLinesDisable'
	exe ':set nonu'
	exe ':colorscheme github'
	exe ':runtime! /syntax/2html.vim'
endfunction

function! AlignCSV()
	exe ':silent %!column -t'
endfunction

function! Syntax()
	exe ':syntax sync fromstart'
endfunction
