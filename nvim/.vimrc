" Basic config
set number relativenumber
set numberwidth=1
syntax enable
set showcmd
set encoding=utf-8
set showmatch
set tabstop=4
set shiftwidth=4
set splitright
set splitbelow
" set mouse=a
set clipboard=unnamedplus
set noswapfile
set wrap linebreak
set spell
set spelllang=es
set spellfile=~/.vim/dict.add
au TermOpen * setlocal nospell

call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'

" sintax
" Plug 'sheerun/vim-polyglot'

" status bar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" typing
Plug 'jiangmiao/auto-pairs'

" Writting
Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kblin/vim-fountain'

" autocomplete
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'VundleVim/Vundle.vim'
" Plug 'Valloric/YouCompleteMe'

" markdown
Plug 'godlygeek/tabular', {'for': 'markdown'}
" Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'preservim/vim-markdown'

" git
Plug 'tpope/vim-fugitive'

" vim - zoom
Plug 'dhruvasagar/vim-zoom'

call plug#end()

" >>>>> THEMES 
" gruvox
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

" tokyonight
" colorscheme tokyonight-moon
" let g:tokyonight_contrast_dark = "hard"

" status bar
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
" let g:lightline = {'colorscheme': 'tokyonight'}

" >>>>> DEV TOOLS
" easymotion
let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)

" coc
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
" 
" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

" nerdtree
function OpenFile()
	:NERDTreeToggle
	:NERDTreeFind
endfunction

nmap <Leader>nt :call OpenFile()<CR>
let NERDTreeQuitOnOpen=1

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" PANES & TABS
" Change panes size
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><
nmap <Leader>x <C-w>x

" faster scrolling
" nnoremap <C-j> 10<C-e>
" nnoremap <C-k> 10<C-y>

" run current file in node js
" nnoremap <Leader>x :!node %<cr>

" terminal
tnoremap <Esc> <C-\><C-n>
nmap <Leader>tv :65vsplit \| terminal<CR>
nmap <Leader>th :20split \| terminal <CR>
nmap <Leader>tt :tabnew \| terminal<CR>

" tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-x> :tabc<CR>

" Move between Windows
nmap gc <C-w>w
" nmap hg <C-w><S-h>
" nmap ht <C-w><S-k>
" nmap hr <C-w>r
nmap <Leader>f <C-w>m

" FILE CONFIG
" custom save & exit
function QuitGoyo()
	if exists('#goyo')
		:wq
	endif
	:wq
endfunction

nmap <Leader>w :w<CR>
nmap <Leader>ww :call QuitGoyo()<CR>
nmap <Leader>q :q<CR>
nmap <Leader>qq :q!<CR>

" EDITOR MAPPINGS
" remap Esc
inoremap jk <Esc>
inoremap kj <Esc>

" Visual block map
" nnoremap <Leader>v <C-v>

" toggle highlight
nmap <Leader>h :noh<CR>

" Move around document
" nmap <S-f> <C-f>
" nmap <S-b> <C-b>

" Paste yank
nmap ,p "0p

" WRITING
" Disable autosuggestions on md
autocmd FileType markdown let b:coc_suggest_disable = 1
autocmd FileType fountain let b:coc_suggest_disable = 1

" markdown config
let g:vim_markdown_math = 1
let g:indentLine_fileTypeExclude = ['markdown']
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_emphasis_multiline = 0
nmap <Leader>tc :Toc<CR>
nnoremap <expr><enter> &ft=="qf" ? "<cr>:lcl<cr>" : (getpos(".")[2]==1 ? "i<cr><esc>": "i<cr><esc>l")

" Goyo
nmap <leader>g :Goyo<CR>
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!
" let g:limelight_conceal_ctermfg = 'gray'
" let g:limelight_conceal_ctermfg = 252

" Spell lang
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell

" Create pdf with pandoc
function Run()
	:w
	:cexpr system('pandoc -o pdf' . expand('%:r') . '.pdf ' . expand('%:t'))
endfunction
nmap <Leader>d :call Run()<CR>

" Copy all text to clipboard
function CpyTxt()
	:w
	:cexpr system('cat '. expand('%:t') . ' | xclip -sel clip')
endfunction
nmap <Leader>c :call CpyTxt()<CR>

" Gen uuid code (lenght = 8)
" function GenUuid()
" 	"g:test = system('uuidgen | cut -d- -f1')
" 	":redir @5 | :cexpr system('uuidgen | cut -d- -f1') | redir END
" 	":redir @5 | :cexpr test | redir END
" 	":cexpr system('uuidgen | grep -o "^[^-]*" | xclip -sel clip')
" 	:cexpr system('uuidgen | grep -o "^[^-]*" | tr -d "\n" | xclip -sel clip')
" endfunction
" imap <C-u> <Esc>:call GenUuid()<CR>"+pa

function GenReadable()
	":cexpr system('/home/miguehm/beauty | cut -d" " -f1,1,2,4 | awk "{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1" | tr -d " " | tr -d "\n" | xclip -sel clip')
	:cexpr system('/home/miguehm/beauty | cut -d" " -f1,1,2,4 | tr " " "_" | tr -d "\n" | xclip -sel clip')
endfunction
imap <C-u> <Esc>:call GenReadable()<CR>"+pa

"nmap <Leader>u :call GenUuid()<CR>"+p

" Paste linux clipboard
" nmap <Leader>p "+p
