set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim/
set rtp+=~/.fzf
set rtp+=~/.vim/bundle/YouCompleteMe

"General settings
set number
set clipboard=unnamedplus
set guioptions+=a
set linebreak
set nowrap
syntax enable
set laststatus=2 " show the satus line all the time
set ttyfast " for faster redrawing
set diffopt+=vertical " for faster redrawing
set nosol " to prevent cursor from jumping to the start of the line while switching buffers
set autoread " to reload the files i.e. when the git branch is changed
set timeoutlen=1000 ttimeoutlen=0 "To avoid typing characters after pressing escape
set showtabline=2 "always show tabline


"Buffer options
set hidden
set nobackup
set nowritebackup
set cmdheight=2
nnoremap <Space> :bn<CR>
nnoremap <C-@> :bp<CR>
nnoremap qq :bp<bar>sp<bar>bn<bar>bd<CR>

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

"Color theme related things
"if (has("termguicolors"))
" set termguicolors
"endif
set bg=dark
let ayucolor="dark"
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

set term=screen-256color


"All the plugins come here
call plug#begin('~/.vim/plugged')

"THEMES
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'VundleVim/Vundle.vim'

Plug 'elzr/vim-json'

Plug 'junegunn/fzf.vim'

Plug 'jiangmiao/auto-pairs'

"Forriting in markdown
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'suan/vim-instant-markdown'


Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-surround'
Plug 'gorodinskiy/vim-coloresque'
Plug 'alvan/vim-closetag'
Plug 'ctrlpvim/ctrlp.vim'

"Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'taohexxx/lightline-buffer'

Plug 'Valloric/YouCompleteMe'

Plug 'scrooloose/nerdcommenter'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'nikvdp/ejs-syntax'
Plug 'leafgarland/typescript-vim'


" Plugin 'scrooloose/syntastic'

"Plugin 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
"Plugin 'maxmellon/vim-jsx-pretty'
"Plugin 'othree/javascript-libraries-syntax.vim'

Plug 'google/vim-searchindex'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"TEST FEATURES
"Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"Support for JSX / REACT
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1

"Gitgutter settings
set updatetime=50
"end of Gitgutter settings

"NERDTree settings
""autocmd VimEnter * NERDTree
let g:NERDTreeWinPos = "left"
let g:NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
let g:NERDTreeLimitedSyntax = 1
"let NERDTreeHighlightCursorline=0
let NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = ''
hi! NERDTreeCWD guifg=#99c794
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"map toggle NerdTree
nmap <C-n> :NERDTreeToggle<CR>

"Unhighlight with escape
nmap <Esc> :noh <CR>

"Ack settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
let g:ackhighlight = 1
let g:ack_autoclose = 1
"end of Ack settings

" YouCompleteMe settings
let g:ycm_semantic_triggers = {
	\   'css': [ 're!^\s{2}', 're!:\s+' ],
	\ }
set completeopt-=preview

filetype plugin indent on
let g:vim_json_syntax_conceal = 0
"autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

"indentGuides options
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2

"Highlight current word's twins
let g:vim_current_word#highlight_current_word = 0

"Markdown options
let g:vim_markdown_folding_disabled = 1
let g:instant_markdown_autostart = 0
let g:goyo_width = 100
nnoremap <F8> :Goyo<CR>


set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4
set smarttab

"KEY MAPPINGS
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
nnoremap Y y$
noremap H ^
noremap L $

"map fuzzy search things
nmap <Leader>l :Lines<CR>


"NERDCommenter setup
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


"Close tags in .js / .jsx (REACT DEVELOPMENT)
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx'
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.html.erb,*.md'
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
"autocmd BufNewFile,BufRead *.ts set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

"Airline fixes - shows name of the file instead of UTF8
" let g:airline_section_y = '%t'
" let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
" let g:airline_powerline_fonts = 1
" let g:airline_section_warning = 0
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_detect_paste=1

" use lightline-buffer in lightline
let g:lightline = {
	\ 'colorscheme': 'dracula',
    \ 'tabline': {
    \   'left': [ 
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
    \ 'component': {
    \   'separator': '',
    \ },
    \ }

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" enable devicons, only support utf-8
" require <https://github.com/ryanoasis/vim-devicons>
let g:lightline_buffer_enable_devicons = 1

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1

" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'

" hide buffer list
let g:lightline_buffer_excludes = ['vimfiler']

" max file name length
let g:lightline_buffer_maxflen = 30

" max file extension length
let g:lightline_buffer_maxfextlen = 3

" min file name length
let g:lightline_buffer_minflen = 16

" min file extension length
let g:lightline_buffer_minfextlen = 3

" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20

"Copy paste outside of vim
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p

"cursorline option
nnoremap 11 :set cursorline!<cr>

"Moving between windows with ctrl-l ctrl-h
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h


"remapping the arrow keys- making scroll + arrow work
nnoremap <silent> <ESC>OA <UP>
nnoremap <silent> <ESC>OB <DOWN>
nnoremap <silent> <ESC>OC <RIGHT>
nnoremap <silent> <ESC>OD <LEFT>
inoremap <silent> <ESC>OA <UP>
inoremap <silent> <ESC>OB <DOWN>
inoremap <silent> <ESC>OC <RIGHT>
inoremap <silent> <ESC>OD <LEFT>


" F U Z Z Y   F I N D "
"
"
"
" fuzzy find files in the working directory (where you launched Vim from)
nnoremap <silent> ff :GFiles<cr>|
nnoremap <silent> fg :Files<cr>|
" fuzzy find lines in the current file
nmap <C-f> :BLines<cr>|
" fuzzy find text in the working directory
nmap <C-\> :Rg |



set wildignore+=*/tmp/*                                     " ctrlp - ignore files in tmp directories
set wildignore+=*/target/*                                  " ctrlp - ignore files in target directories
set wildignore+=*/build/*                                   " ctrlp - ignore gradle build directories
set wildignore+=*.so                                        " ctrlp - ignore .so files
set wildignore+=*.o                                         " ctrlp - ignore .o files
set wildignore+=*.class                                     " ctrlp - ignore .class files
set wildignore+=*.swp                                       " ctrlp - ignore .swp files
set wildignore+=*.zip                                       " ctrlp - ignore .zip files
set wildignore+=*.pdf                                       " ctrlp - ignore .pdf files
set wildignore+=*/node_modules/*                            " ctrlp - ignore node modules
set wildignore+=*/bower_components/*                        " ctrlp - ignore bower components
set wildignore+=*/dist/*
set wildignore+=*/bin/*

"ADD EJS SUPPORT
au BufNewFile,BufRead *.ejs set filetype=html

autocmd FileType javascript nmap <buffer> <C-]> :YcmCompleter GoTo<CR>
let g:jsx_ext_required = 0
let g:ale_linters = {
\   'javascript': ['prettier', 'eslint'],
\   'jsx': ['eslint'],
\}
let g:ale_fixers = { 'javascript': ['eslint', 'prettier']}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_set_baloons = 1
let g:ale_echo_msg_format = '%linter% says %s'

func! s:matchparen_cursorcolumn_setup()
  augroup matchparen_cursorcolumn
    autocmd!
    autocmd CursorMoved * if get(w:, "paren_hl_on", 0) | set cursorcolumn | else | set nocursorcolumn | endif
    autocmd InsertEnter * set nocursorcolumn
  augroup END
endf
if !&cursorcolumn
  augroup matchparen_cursorcolumn_setup
    autocmd!
    " - Add the event _only_ if matchparen is enabled.
    " - Event must be added _after_ matchparen loaded (so we can react to w:paren_hl_on).
    autocmd CursorMoved * if exists("#matchparen#CursorMoved") | call <sid>matchparen_cursorcolumn_setup() | endif
          \ | autocmd! matchparen_cursorcolumn_setup
  augroup END
endif
