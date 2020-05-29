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

Plug 'ntk148v/vim-horizon' " Because if you dislike it, you're wrong.
Plug 'jremmen/vim-ripgrep' " Because I <3 fuzzy searching
Plug 'tpope/vim-fugitive' " Because I'm not a git ;)
Plug 'leafgarland/typescript-vim' " Because no editor is complete without TS.
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Because is it really an
                                                " editor without completion?
Plug 'git@github.com:ctrlpvim/ctrlp.vim.git' " Because I <3 even more fuzzy 
                                             " searching
Plug 'mbbill/undotree' " Because we all make mistakes. Me more so than you.
Plug 'preservim/nerdtree' " Because I like being able to see my files
Plug 'vimwiki/vimwiki' " Because it lets me document stuff
Plug 'neoclide/jsonc.vim' " Because ya boi likes JSON w/ comments
Plug 'itchyny/lightline.vim' " Because it looks cool. Leave me be, ok?

Plug 'udalov/kotlin-vim'
call plug#end()

" Theming, because Vim's default theme makes me regurgitate my noonly meal
colorscheme horizon
let g:lightline = {'colorscheme' : 'horizon'}

" If I have Ripgrep installed, derive the root? This isn't my line.
if executable('rg')
  let g:rg_derive_root='true'
endif

" I like space. Give me space. I will press space.
let mapleader = " "

" Some more misc stuff.
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0

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

" Ripgrep shortcut
nnoremap <Leader>ps :Rg<SPACE>

" Quick resizing
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" YouCompleteMe shortcuts
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" Move a line up or down a la VSCode
nnoremap <M-Up> :move -2<CR>
nnoremap <M-Down> :move +1<CR>

" Open ctrlp
nnoremap <silent> <Leader>s :CtrlP<CR>
