if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin ("~/.config/nvim/plugged")
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dikiaap/minimalist'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'arcticicestudio/nord-vim'
Plug 'jdkanani/vim-material-theme'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'suan/vim-instant-markdown'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-eslint', 'coc-rls']
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tveskag/nvim-blame-line'

Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'romainl/vim-cool'
Plug 'mattn/emmet-vim'
Plug 'machakann/vim-highlightedyank'

" TEST FEATURE
call plug#end()


" General settings
set termguicolors
let g:quantum_black=1
let g:quantum_italics=1
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
" hi CursorLine guibg=#333111
" hi CursorColumn guibg=#333111
" hi CursorLineNR guibg=#333111
" hi Search guibg=#eeeeee
" hi CocErrorFloat guifg=#eeeeee
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
set wrap
set linebreak
let g:AutoPairsShortcutToggle = ''
let &fcs='eob: ' " remove tildas
" Enable Italics
let &t_ZH = "\e[3m"
let &t_ZR = "\e[23m"

"NORD THEME
let g:nord_cursor_line_number_background = 0
let g:nord_uniform_status_lines = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

"Blameline settings
autocmd BufEnter * EnableBlameLine
let g:blameLineVirtualTextPrefix = ' || '

"Prettier Settings
let g:prettier#exec_cmd_async = 1 " Force asynchronous formatting
let g:prettier#autoformat = 0 " Enable autoformatting
let g:prettier#autoformat_require_pragma = 0 " Run on save even on files without @format tag
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

"Setting default vim directories so the swap files do not pollute the current
"folders
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

"Buffer options
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=500
set signcolumn=yes
"highlight SignColumn guibg=#111
nnoremap <Space> :bn<CR>
nnoremap <C-Space> :bp<CR>
nnoremap qq :bp<bar>sp<bar>bn<bar>bd<CR>
" if (has("termguicolors"))
 " set termguicolors
" endif
if &term =~# '256color' && ( &term =~# '^screen'  || &term =~# '^tmux' )
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
" Disable folding for markdown files
let g:vim_markdown_folding_disabled = 1
set t_Co=256

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
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" end of COC options


"Split options
set splitbelow
set splitright
nnoremap [[ 20<c-><
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
" let g:NERDTreeDirArrowExpandable = '⬏'
" let g:NERDTreeDirArrowCollapsible = '⬎'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
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
" open terminal on ctrl+t
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
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

"Airline fixes - shows name of the file instead of UTF8
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 1
let g:airline_powerline_fonts = 1
let g:airline_section_warning = 0
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline_detect_paste=1
let g:airline#extensions#coc#enabled = 1
let g:airline_theme='quantum'
let g:webdevicons_enable_airline_tabline = 0

"NERDCommenter setup
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
nmap <C-p>   <Plug>NERDCommenterToggle <Esc>
vmap <C-p>   <Plug>NERDCommenterToggle<CR>gv
let g:NERDCompactSexyComs = 1

