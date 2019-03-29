set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim/
set rtp+=~/.fzf

set number
set hlsearch
set clipboard=unnamedplus
set guioptions+=a
set wrap
set linebreak
syntax enable

"Buffer options
set hidden
nnoremap <Space> <C-W>l :bn<CR>
nnoremap <C-@> <C-W>l :bp<CR>
nnoremap qq :bp<bar>sp<bar>bn<bar>bd<CR>


"Search settings
set ignorecase

"Cursorline
set cursorline

"Setting default vim directories so the swap files do not pollute the current
"folders
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"Color theme related things
if (has("termguicolors"))
 set termguicolors
endif
set bg=dark
let ayucolor="dark"
colorscheme gruvbox


"All the plugins come here
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'elzr/vim-json'

Plugin 'prabirshrestha/asyncomplete.vim'

Plugin 'junegunn/fzf.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'

Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'gorodinskiy/vim-coloresque'

"Plugin 'haishanh/night-owl.vim'
"Plugin 'ayu-theme/ayu-vim'
Plugin 'tomasiser/vim-code-dark'

Plugin 'vim-airline/vim-airline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

"Plugin 'vim-syntastic/syntastic'
"Plugin 'walm/jshint.vim'

Plugin 'scrooloose/nerdcommenter'
Plugin '1995eaton/vim-better-javascript-completion'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mileszs/ack.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'ap/vim-buftabline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

call vundle#end()

let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
"Gitgutter settings
set updatetime=100
"end of Gitgutter settings


let g:NERDTreeLimitedSyntax = 1
nmap <Esc> :noh <CR>

"Ack settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
"end of Ack settings

"ALE settings
let g:ale_completion_enabled = 1
let g:ale_lint_on_enter = 0
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '-'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
"end of ALE settings

let g:airline_powerline_fonts = 1
let g:ackhighlight = 1

filetype plugin indent on
let g:vim_json_syntax_conceal = 0
autocmd VimEnter * NERDTree
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript


let NERDTreeHighlightCursorline=0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeHijackNetrw=1
let NERDTreeShowHidden=1
"autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"

set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
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
nmap <Leader>l :Lines<CR>

"map toggle NerdTree
nmap <Leader>t :NERDTreeToggle<CR>

"NERDCommenter setup
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


set completeopt+=menuone
set completeopt+=noinsert
let g:mucomplete#enable_auto_at_startup = 1
set wildmenu
set showmatch 

"Airline fixes - shows name of the file instead of UTF8
let g:airline_section_y = '%t'
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0

"Copy paste outside of vim
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p

nnoremap 11 :set cursorline!<cr>

noremap <C-l> <C-W>l
noremap <C-h> <C-W>h 

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"remapping the arrow keys- making scroll + arrow work
nnoremap <silent> <ESC>OA <UP>
nnoremap <silent> <ESC>OB <DOWN>
nnoremap <silent> <ESC>OC <RIGHT>
nnoremap <silent> <ESC>OD <LEFT>
inoremap <silent> <ESC>OA <UP>
inoremap <silent> <ESC>OB <DOWN>
inoremap <silent> <ESC>OC <RIGHT>
inoremap <silent> <ESC>OD <LEFT>
