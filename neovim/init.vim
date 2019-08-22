" Auto install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Interface
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" Git
Plug 'tpope/vim-fugitive', {
    \ 'on': ['Gstatus', 'Gcommit', 'Gdiff', 'Gedit',
    \ 'Gread', 'Gwrite', 'Glog', 'Ggrep', 'Gmove']
    \ }
Plug 'tpope/vim-rhubarb', {'on': ['Git', 'Dispatch']}
Plug 'airblade/vim-gitgutter', {'on': 'GitGutter'}
Plug 'tsony-tsonev/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}

" NERDTree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': 'NERDTreeToggle'}

" Other
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'machakann/vim-highlightedyank'
Plug 'alvan/vim-closetag', {'for': ['javascript', 'typescript', 'html']}
Plug 'talek/obvious-resize', {
      \ 'on': ['ObviousResizeUp', 'ObviousResizeDown',
      \ 'ObviousResizeLeft', 'ObviousResizeRight']}
Plug 'wesQ3/vim-windowswap'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-dispatch', {'on': 'Dispatch'}
Plug 'mattn/emmet-vim'

" Languages
Plug 'jparise/vim-graphql', {'for': 'graphql'}
Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}
Plug 'chemzqm/vim-jsx-improve', {'for': 'javascript'}
Plug 'ap/vim-css-color', {'for': ['css', 'scss']}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}

" FZF
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'neoclide/coc-tsserver', {
      \ 'do': 'yarn install --frozen-lockfile',
      \ 'for': ['typescript']}
Plug 'neoclide/coc-snippets', {
      \ 'do': 'yarn install --frozen-lockfile',
      \ 'for': ['javascript', 'typescript', 'graphql']}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile', 'for': 'json'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile', 'for': 'html'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile', 'for': ['css', 'scss']}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile', 'for': 'yaml'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile', 'for': 'javascript'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile', 'for': 'typescript'}
Plug 'neoclide/coc-prettier', {
      \ 'do': 'yarn install --frozen-lockfile',
      \ 'for': ['javascript', 'typescript', 'graphql', 'html', 'json', 'css', 'scss']}
Plug 'neoclide/coc-jest', {
      \ 'do': 'yarn install --frozen-lockfile',
      \ 'for': ['javascript', 'typescript']}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile', 'for': 'javascript'}
call plug#end()

" Enable support to true colors
set termguicolors

" Theme
set background=dark
colorscheme gruvbox
let g:gruvbox_italic=1
let g:gruvbox_bold=1

" Editor
set number relativenumber
set nu rnu
set expandtab
set tabstop=2
set shiftwidth=2
set nohlsearch

set splitbelow        " Open any window below
set lazyredraw        " Faster redraws
set noequalalways     " Splits windows into equal sizes
set eadirection=both
set noshowcmd         " Show partial commands
set sessionoptions-=buffers " Persist only visible buffers
set nohidden                " Dont keep buffers forever
set colorcolumn=80    " Highlight ruler at colum 90
set nohlsearch        " Don't highlight search matches
set scrolloff=5       " Show 5 lines of context around the cursor
set title             " Set the terminal's title
set titlestring=%t    " Set the terminal's title to filename.
set novb              " Don't blink screen on stuff
set dir=~/tmp         " SWAP files location
set diffopt+=vertical " Always diff using vertical mode
syntax on             " Enable syntax highlighting
set cmdheight=2       " Remove 'press any key to continue'
set foldmethod=indent " Use decent folding
set signcolumn=yes    " always show signcolumns
set nowrap            " Don't break long lines

let mapleader = ","

" Improve navigation
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Terminal navigation
tnoremap <C-h> <C-\><C-n><C-w><C-h>
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-l> <C-\><C-n><C-w><C-l>

" Terminal
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
nnoremap <leader>vsh :vsplit term://zsh<CR>i
nnoremap <leader>sh :split term://zsh<CR><C-\><C-n>:resize 10<CR>i

" Navigation between tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>w :tabnext<CR>
nnoremap <leader>W :tabprev<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" FZF
let $FZF_DEFAULT_COMMAND = 'ag --ignore *lock -g ""'
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--ignore *lock*', <bang>0)
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
imap <C-x><C-f> <plug>(fzf-complete-path)
nnoremap <C-p> :Files<cr>
nnoremap <C-f> :Ag<cr>

" NERDTree
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$', '\.DS_Store$']

" Airline
let g:airline_theme = 'gruvbox'
let g:airline_inactive_collapse = 0
let g:airline_powerline_fonts = 1

function! ModeChar ()
  return toupper(mode())
endfunction

call airline#parts#define_function('mode', 'ModeChar')
call airline#parts#define_minwidth('mode', 1)

function! ReadonlyIndicator ()
  if &readonly
    return ''
  endif

  return ''
endfunction

call airline#parts#define_function('readonly', 'ReadonlyIndicator')
call airline#parts#define_minwidth('readonly', 1)

function! ModifiedIndicator ()
  if &mod
    return '●'
  endif

  return ''
endfunction

call airline#parts#define_function('modified', 'ModifiedIndicator')
call airline#parts#define_minwidth('modified', 1)

let g:airline_section_a = airline#section#create_right(['mode'])
let g:airline_section_c = airline#section#create([
      \ '%<', 'readonly', 'modified', ' %{get(b:, "term_title", expand("%:t"))}'
      \ ])
let g:airline_section_z = airline#section#create_right(['%l:%c %L'])

let g:airline#extensions#default#section_truncate_width = {
      \ 'a': 60,
      \ 'b': 80,
      \ 'x': 100,
      \ 'y': 100,
      \ 'z': 60,
      \ }

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" CoC
" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position
" Coc only does snippet and additional edit on confirm
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-l>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-h>'

" NERDTree Git
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:NERDTreeDirArrowExpandable = nr2char(8200)
let g:NERDTreeDirArrowCollapsible = nr2char(8200)

let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1

let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeColorMapCustom = {
      \ "Modified"  : "#528AB3",
      \ "Staged"    : "#538B54",
      \ "Untracked" : "#BE5849",
      \ "Dirty"     : "#299999",
      \ "Clean"     : "#87939A",
      \ "Ignored"   : "#808080"
      \ }

" Fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

" Git Gutter
autocmd BufWritePost * GitGutter

" Obvious Resize
noremap <silent> <S-Up> :<C-U>ObviousResizeUp<CR>
noremap <silent> <S-Down> :<C-U>ObviousResizeDown<CR>
noremap <silent> <S-Left> :<C-U>ObviousResizeLeft<CR>
noremap <silent> <S-Right> :<C-U>ObviousResizeRight<CR>

" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Closetag
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'

" Indentguide
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indentguides_ignorelist = ['help', 'text', 'nerdtree']

" Editor Config
let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']

" Emmet
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
      \  'javascript' : {
      \      'extends' : 'jsx',
      \  },
      \  'typescript' : {
      \      'extends' : 'jsx',
      \  },
      \}

" GitGutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk
