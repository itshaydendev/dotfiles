"""
""" itshaydenvim - Hayden Young's Neovim config
"""

" Enable syntax highlighting
syntax on

" Some sensible defaults (thanks ThePrimeagen)
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undodir
set undofile
set incsearch
set nocompatible
set termguicolors
filetype plugin on

" Create a highlighted column at 80 characters to know when to wrap your text
" lines
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" vim-plug for plugin installations
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ntk148v/vim-horizon'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'neoclide/jsonc.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SidOfc/mkdx'
Plug 'editorconfig/editorconfig-vim'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }

call plug#end()

" Theming, because Vim's default theme makes me regurgitate my noonly meal
colorscheme onehalfdark
let g:lightline = {}
let g:lightline.colorscheme='onehalfdark'
let g:lightline.active = {
                        \  'left': [ [ 'mode' ], [ 'readonly', 'filename' ] ],
                        \  'right': [ [ 'gitbranch' ] ]
                        \}

" If I have Ripgrep installed, derive the root? This isn't my line.
if executable('rg')
  let g:rg_derive_root='true'
endif

" I like space. Give me space. I will press space.
let mapleader = " "

let g:mkdx#settings = { 'highlight': { 'enable': 1 },
                      \ 'enter': { 'shift': 1 },
                      \ 'links': { 'external': { 'enable': 1 } },
                      \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                      \ 'fold': { 'enable': 1 } }

" Setting up relative line numbers
set relativenumber

" Window movements
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Shortcut for undo tree
nnoremap <leader>u :UndotreeShow<CR>

" NERDTree toggler
nnoremap <leader>pv :NERDTreeToggle<CR>

" Shortcut to quit
nnoremap <leader>q :q<CR>

" Quick resizing
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" YouCompleteMe shortcuts
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>

" Move a line up or down a la VSCode
nnoremap <M-Up> :move -2<CR>
nnoremap <M-Down> :move +1<CR>

" Open fzf
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>s :Rg<CR>

" FZF fixes
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

" Navigation changes
nmap >> <Nop>
nmap << <Nop>
vmap >> <Nop>
vmap << <Nop>
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >>
vnoremap <S-Tab> <<

map $ <Nop>
map ^ <Nop>
map { <Nop>
map } <Nop>

noremap K     {
noremap J     }
noremap H     ^
noremap L     $

inoremap <S-Tab> <Esc>
onoremap <S-Tab> <Esc>

" Jump to first non-whitespace
function! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') == first_nonblank
    return '0'  " if at first nonblank, go to start line
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction
noremap <expr> <silent> <Home> SmartHome()
imap <silent> <Home> <C-O><Home>

