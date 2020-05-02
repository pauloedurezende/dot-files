" Auto install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Interface
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb', {'on': ['Git', 'Dispatch']}

" Other
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'mg979/vim-visual-multi'
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
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdcommenter'

" Languages
Plug 'jparise/vim-graphql', {'for': ['typescript', 'javascript', 'graphql']}
Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}
Plug 'ap/vim-css-color', {'for': ['css', 'scss']}
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
Plug 'yuezk/vim-js', {'for': 'javascript'}
Plug 'maxmellon/vim-jsx-pretty', {'for': ['javascript', 'typescript']}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'lifepillar/pgsql.vim', {'for': 'sql'}

" FZF
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {
      \ 'do': 'yarn install --frozen-lockfile',
      \ 'for': ['typescript', 'javascript']}
Plug 'neoclide/coc-snippets', {
      \ 'do': 'yarn install --frozen-lockfile',
      \ 'for': ['javascript', 'typescript', 'graphql']}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile', 'for': 'json'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile', 'for': 'html'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile', 'for': ['css', 'scss']}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile', 'for': 'yaml'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile', 'for': 'javascript'}
Plug 'neoclide/coc-prettier', {
      \ 'do': 'yarn install --frozen-lockfile',
      \ 'for': ['javascript', 'typescript', 'graphql', 'json']}
Plug 'neoclide/coc-jest', {
      \ 'do': 'yarn install --frozen-lockfile',
      \ 'for': ['javascript', 'typescript']}
Plug 'neoclide/coc-stylelint', {
      \ 'do': 'yarn install --frozen-lockfile',
      \ 'for': ['css', 'wxss', 'scss', 'less', 'postcss', 'sugarss', 'vue', 'javascript', 'typescript']}
Plug 'fannheyward/coc-styled-components', {
      \ 'do': 'yarn install --frozen-lockfile',
      \ 'for': ['javascript', 'typescript']}
Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': ['javascript', 'typescript'] }
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}

" Snippets
Plug 'dsznajder/vscode-es7-javascript-react-snippets', {
      \ 'do': 'yarn install --frozen-lockfile',
      \ 'for': ['javascript', 'typescript']}

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
set dir=~/.swap-vim   " SWAP files location
set diffopt+=vertical " Always diff using vertical mode
syntax on             " Enable syntax highlighting
set cmdheight=2       " Remove 'press any key to continue'
set foldmethod=indent " Use decent folding
set foldlevelstart=50 " Files open expanded
set signcolumn=yes    " always show signcolumns
set nowrap            " Don't break long lines
set nobackup          " Don't make a backup before overwriting a file.
set nowritebackup     " And again.
set updatetime=300    " Decrease update time to a better experience

let mapleader = ","

" Behavior changes
vnoremap > >gv
vnoremap < <gv

" Improve navigation
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
noremap H ^
noremap L $

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
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!{.git/*}"'
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --glob "!{node_modules/*,.git/*,*lock*,*.log}" '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
nmap <leader>f :Files<cr>
nmap <leader>/ :BLines<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>r :Rg<cr>
nmap <leader>c :Commands<cr>

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

call airline#parts#define_function('icon', 'WebDevIconsGetFileTypeSymbol')
call airline#parts#define_minwidth('icon', 1)

let g:airline_section_a = airline#section#create(['mode'])
let g:airline_section_c = airline#section#create([
  \ '%<', 'readonly', 'icon',
  \ ' %{get(b:, "term_title", expand("%:t"))} ',
  \ 'modified'
  \ ])

let g:airline_section_x = airline#section#create([
  \ '%{get(b:, "coc_current_function", "")}'
  \ ])
let g:airline_section_z = airline#section#create_right([
  \ '%l:%c %L'
  \ ])

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
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

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

" Rename symbol under cursor to a new word
nmap <leader>rn <Plug>(coc-rename)

" Remap for refactor of current symbol
nmap <Leader>rf <Plug>(coc-refactor)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-l>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-h>'

" Remap keys for applying codeAction to the current line
nmap <leader>ca  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Open explorer
nmap <leader>e :CocCommand explorer --sources=file+<CR>

" Navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)

" Copy line URL
nmap <leader>gcu :CocCommand git.copyUrl<CR>

" Manipulete chunk
nmap <leader>ghi :CocCommand git.chunkInfo<CR>
nmap <leader>ghu :CocCommand git.chunkUndo<CR>
nmap <leader>gha :CocCommand git.chunkStage<CR>

" Show commit of selected line
nmap <leader>gsc :CocCommand git.showCommit<CR>

" Open line on browser
nmap <leader>gob :CocCommand git.browserOpen<CR>

" Setup Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Format selected content
vmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format-selected)

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

" Obvious Resize
let g:obvious_resize_default = 5
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
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" IndentLine
let g:indentLine_char = '¦'
let g:indentLine_fileTypeExclude = ['text', 'coc-explorer']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*']

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

" Git Mergetool
nnoremap <leader>dgb :diffg BASE<CR>
nnoremap <leader>dgl :diffg LOCAL<CR>
nnoremap <leader>dgr :diffg REMOTE<CR>

" VIM JSX Pretty
let g:vim_jsx_pretty_colorful_config = 1

" Zen Mode
nnoremap <leader>z :Goyo<CR>

" File Extensions
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.ts set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
