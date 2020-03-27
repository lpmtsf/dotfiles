call plug#begin("~/.vim/plugged")
Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
call plug#end()

" General settings
colorscheme dracula
set number
set clipboard=unnamedplus
set guioptions+=a
set nowrap
syntax enable
set laststatus=2 " show the satus line all the time
set ttyfast " for faster redrawing
set diffopt+=vertical " for faster redrawing
set nosol " to prevent cursor from jumping to the start of the line while switching buffers
set autoread " to reload the files i.e. when the git branch is changed
set timeoutlen=1000 ttimeoutlen=0 "To avoid typing characters after pressing escape
set showtabline=2 "always show tabline
hi Normal guibg=NONE ctermbg=NONE
set cursorline

"Buffer options
set hidden
set nobackup
set nowritebackup
set cmdheight=2
nnoremap <Space> :bn<CR>
nnoremap <C-@> :bp<CR>
nnoremap qq :bp<bar>sp<bar>bn<bar>bd<CR>
if (has("termguicolors"))
 set termguicolors
endif

"Spellcheck highlight settings
"augroup my_colours
"  autocmd!
"  autocmd ColorScheme gruvbox hi SpellBad ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#ffff00
"augroup END
autocmd BufRead,BufNewFile *.md setlocal spell


"Setting default vim directories so the swap files do not pollute the current
"folders
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"Split options
set splitbelow
set splitright
nnoremap [[ 20<c-w><
nnoremap ]] 20<c-w>>
nnoremap <c-[> 20<c-w>+
nnoremap <c-{> 20<c-w>+

"Search settings
set ignorecase
set hlsearch
set scrolloff=30

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
