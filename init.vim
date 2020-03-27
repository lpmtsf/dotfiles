call plug#begin ("~/.config/nvim/plugged")
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dikiaap/minimalist'
Plug 'tyrannicaltoucan/vim-quantum'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'

Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'suan/vim-instant-markdown'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'
Plug 'romainl/vim-cool'
Plug 'mattn/emmet-vim'
call plug#end()

" General settings
"let g:quantum_black=1
colorscheme quantum
set number
set nu relativenumber
set clipboard=unnamedplus
set cursorline
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
map <Esc> :noh <CR>
set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4
set smarttab
nnoremap Y y$
noremap H ^
noremap L $
set ignorecase
set hlsearch
set scrolloff=30
set shortmess+=c

"Setting default vim directories so the swap files do not pollute the current
"folders
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"Buffer options
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set signcolumn=yes
nnoremap <Space> :bn<CR>
nnoremap <C-Space> :bp<CR>
nnoremap qq :bp<bar>sp<bar>bn<bar>bd<CR>
if (has("termguicolors"))
 set termguicolors
endif

" Disable folding for markdown files
let g:vim_markdown_folding_disabled = 1

" COC options
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:coc_status_error_sign = '✘'
let g:coc_status_warning_sign = '⚠'

" end of COC options


"Spellcheck highlight settings
autocmd BufRead,BufNewFile *.md setlocal spell

"Split options
set splitbelow
set splitright
nnoremap [[ 20<c-w><
nnoremap ]] 20<c-w>>
nnoremap <c-[> 20<c-w>+
nnoremap <c-{> 20<c-w>+
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h


" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'
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

" fuzzy find files in the working directory (where you launched Vim from)
nnoremap <silent> ff :GFiles<cr>|
nnoremap <silent> fg :Files<cr>|
nmap <C-f> :BLines<cr>|
nmap <C-\> :Ag<cr>|

" Closing tags in react/jsx
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.html.erb,*.md'
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
"autocmd BufNewFile,BufRead *.ts set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

"Airline fixes - shows name of the file instead of UTF8
let g:airline_section_y = '%t'
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
let g:airline_powerline_fonts = 0
let g:airline_section_warning = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_paste=1
let g:airline#extensions#coc#enabled = 0

"NERDCommenter setup
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
nmap <C-p>   <Plug>NERDCommenterToggle <Esc>
vmap <C-p>   <Plug>NERDCommenterToggle<CR>gv
let g:NERDCompactSexyComs = 1