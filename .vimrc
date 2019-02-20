set nocompatible
syntax on
set encoding=UTF-8
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
set rtp+=~/.fzf

set number
set hlsearch
set clipboard=unnamedplus
set guioptions+=a


"Setting default vim directories so the swap files do not pollute the current
"folders
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"Color theme related things
if (has("termguicolors"))
 set termguicolors
endif
:set bg=dark
let ayucolor="dark"
colorscheme gruvbox


"All the plugins come here
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'prabirshrestha/asyncomplete.vim'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'jiangmiao/auto-pairs'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'gorodinskiy/vim-coloresque'

Plugin 'haishanh/night-owl.vim'
Plugin 'ayu-theme/ayu-vim'

Plugin 'vim-airline/vim-airline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mileszs/ack.vim'
Plugin 'leafgarland/typescript-vim'

call vundle#end()


"Ack settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
"end of Ack settings

let g:airline_powerline_fonts = 1
let NERDTreeHighlightCursorline = 0
let g:ackhighlight = 1

filetype plugin indent on
autocmd VimEnter * NERDTree
set tabstop=4
set shiftwidth=4
set expandtab
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

"map fuzzy search things
nmap <C-\> :Files<CR>
nmap <Leader>l :Lines<CR>

"map toggle NerdTree
nmap <F8> :NERDTreeToggle<CR>

let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
set completeopt+=menuone
set completeopt+=noinsert
let g:mucomplete#enable_auto_at_startup = 1
set wildmenu

