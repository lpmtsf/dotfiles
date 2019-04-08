set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim/
set rtp+=~/.fzf

"General settings
set number
set clipboard=unnamedplus
set guioptions+=a
set wrap
set linebreak
syntax enable

"Buffer options
set hidden
nnoremap <Space> <C-W>h :bn<CR>
nnoremap <C-@> <C-W>h :bp<CR>
nnoremap qq :bp<bar>sp<bar>bn<bar>bd<CR>

"General Settings
set laststatus=2 " show the satus line all the time
set ttyfast " for faster redrawing
set diffopt+=vertical " for faster redrawing

"Search settings
set ignorecase
set hlsearch
set scrolloff=30

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

Plugin 'junegunn/fzf.vim'

Plugin 'jiangmiao/auto-pairs'

Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'

Plugin 'tpope/vim-surround'
Plugin 'gorodinskiy/vim-coloresque'

Plugin 'prettier/vim-prettier'

Plugin 'haishanh/night-owl.vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'tomasiser/vim-code-dark'

Plugin 'alvan/vim-closetag'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

"Autocomplete plugins
Plugin 'carlitux/deoplete-ternjs'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/context_filetype.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'Shougo/deoplete.nvim'
if !has('nvim')
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'

Plugin 'scrooloose/nerdcommenter'
Plugin '1995eaton/vim-better-javascript-completion'


Plugin 'scrooloose/syntastic'

Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'

Plugin 'mileszs/ack.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'ap/vim-buftabline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

call vundle#end()


let g:airline#extensions#bufferline#enabled = 1

"Support for JSX / REACT
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1

"Gitgutter settings
set updatetime=100
"end of Gitgutter settings

"NERDTree settings
""autocmd VimEnter * NERDTree
let g:NERDTreeWinPos = "right"
let g:NERDTreeLimitedSyntax = 1
let NERDTreeHighlightCursorline=0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeHijackNetrw=1
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
"map toggle NerdTree
nmap <F9> :NERDTreeToggle<CR>

"Unhighlight with escape
nmap <Esc> :noh <CR>

"Ack settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
"end of Ack settings

"ALE settings
" let g:ale_completion_enabled = 1
" let g:ale_lint_on_enter = 0
" let g:ale_sign_error = 'x'
" let g:ale_sign_warning = '-'
" highlight ALEErrorSign ctermbg=NONE ctermfg=red
" highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
"end of ALE settings

let g:ackhighlight = 1

filetype plugin indent on
let g:vim_json_syntax_conceal = 0
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript


set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4
set smarttab
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


"NERDCommenter setup
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

"Autocomplete settings (NEOCOMPLETE)

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
set completeopt+=menuone
set completeopt+=noinsert
let g:mucomplete#enable_auto_at_startup = 1
set wildmenu
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#sources#buffer#cache_limit_size = 50000
let g:neocomplete#data_directory = $HOME.'/.vim/cache/noecompl'
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'


"Close tags in .js / .jsx (REACT DEVELOPMENT)
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx'
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.html.erb,*.md'
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

"Airline fixes - shows name of the file instead of UTF8
let g:airline_section_y = '%t'
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
let g:airline_powerline_fonts = 1

"Copy paste outside of vim
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p

nnoremap 11 :set cursorline!<cr>

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


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"SYNTASTIC

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height=4
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

"" syntastic checkers
" javascript 
let g:syntastic_javascript_checkers = ['eslint']


" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" VIM Prettier options
let g:prettier#config#tab_width = 4

" CTRLP
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <silent> <expr> ff (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":CtrlP\<cr>"
let g:ctrlp_working_path_mode = 0

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
