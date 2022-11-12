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

call plug#begin('~/.vim/plugged')

" Themes
" Plug 'morhetz/gruvbox'
" Plug 'shinchu/lightline-gruvbox.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

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
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" autocomplete
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" markdown
Plug 'godlygeek/tabular', {'for': 'markdown'}
" Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'preservim/vim-markdown'

" git
Plug 'tpope/vim-fugitive'

call plug#end()

" >>>>> THEMES 
" gruvox
" colorscheme gruvbox
" let g:gruvbox_contrast_dark = "hard"

" tokyonight
colorscheme tokyonight-moon
let g:tokyonight_contrast_dark = "hard"

" status bar
" let g:lightline = {}
" let g:lightline.colorscheme = 'gruvbox'
let g:lightline = {'colorscheme': 'tokyonight'}

" >>>>> DEV TOOLS
" easymotion
let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)

" coc
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

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

" >>>>> PANES & TABS
" tmux navigator
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" faster scrolling
" nnoremap <C-j> 10<C-e>
" nnoremap <C-k> 10<C-y>

" run current file
" nnoremap <Leader>x :!node %<cr>

" terminal
tnoremap <Esc> <C-\><C-n>
nmap <Leader>tv :65vsplit \| terminal<CR>
nmap <Leader>th :20split \| terminal <CR>
nmap <Leader>tt :tabnew \| terminal<CR>

" tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-x> :tabc<CR>

" Windows
nmap gc <C-w>w
nmap hg <C-w><S-h>
nmap ht <C-w><S-k>
nmap hr <C-w>r

" >>>>> FILE CONFIG
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

" >>>>>> EDITOR MAPPINGS
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

" >>>>>> WRITING
" Disable autosuggestions on md
autocmd FileType markdown let b:coc_suggest_disable = 1

" markdown config
let g:vim_markdown_math = 1
let g:indentLine_fileTypeExclude = ['markdown']
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_emphasis_multiline = 0
nmap <Leader>tc :Toc<CR>

" Goyo
nmap <leader>g :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 248

" Spell lang
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell
