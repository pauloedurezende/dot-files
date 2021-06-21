" Automatic installation vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Interface
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" Others
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'talek/obvious-resize'
Plug 'haya14busa/is.vim'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/gv.vim'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Conquer of Completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-snippets', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-eslint', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-prettier', { 'do': 'yarn install --frozen-lockfile' }
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-jest', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-stylelint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-html', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-css', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-yaml', { 'do': 'yarn install --frozen-lockfile' }
Plug 'antonk52/coc-cssmodules', { 'do': 'yarn install --frozen-lockfile' }
Plug 'fannheyward/coc-styled-components', { 'do': 'yarn install --frozen-lockfile' }
Plug 'iamcco/coc-tailwindcss', { 'do': 'yarn install --frozen-lockfile' }

" Snippets
Plug 'dsznajder/vscode-es7-javascript-react-snippets', {
      \ 'do': 'yarn install --frozen-lockfile && yarn compile' }

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Leader
let mapleader = ","

" Settings
set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments
syntax enable                           " Enables syntax highlighing
set termguicolors                       " True colors
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set number relativenumber               " Line numbers with relative numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                      " Faster completion
set clipboard=unnamedplus               " Copy paste between vim and everything else
set lazyredraw                          " Don't re-draw everything
set colorcolumn=80                      " Shows a helper column
set scrolloff=5                         " Keeps an area of 5 lines above and below the cursor
set title                               " Set the terminal's title
set titlestring=%t                      " Set the terminal's title to filename.
set noswapfile                          " Disable SWAP

" Functions
function! ModifiedIndicator()
  return &mod ? '●  ' : ''
endfunction

function! ReadonlyIndicator()
  return &readonly ? '  ' : ''
endfunction

" Gruvbox
colorscheme gruvbox
let g:gruvbox_italic=1

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'modified', 'readonly' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'modified': 'ModifiedIndicator',
      \   'readonly': 'ReadonlyIndicator',
      \ }
      \ }

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Indentline
let g:indentLine_char = '¦'
let g:indentLine_fileTypeExclude = ['text', 'coc-explorer']

" Obvious Resize
let g:obvious_resize_default = 5
let g:obvious_resize_run_tmux = 1

noremap <silent> <Up> :<C-U>ObviousResizeUp<CR>
noremap <silent> <Down> :<C-U>ObviousResizeDown<CR>
noremap <silent> <Left> :<C-U>ObviousResizeLeft<CR>
noremap <silent> <Right> :<C-U>ObviousResizeRight<CR>

" Emmet
let g:user_emmet_next_key = '<C-n>'
let g:user_emmet_prev_key = '<C-p>'
let g:user_emmet_settings = {
      \  'javascript' : {
      \      'extends' : 'jsx',
      \  },
      \  'typescript' : {
      \      'extends' : 'jsx',
      \  },
      \}

" Fugitive
nnoremap <leader>ga :Git add %<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit --verbose<CR>
nnoremap <Leader>gA :Gcommit --amend --verbose<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Git branch<CR>
nnoremap <Leader>gB :GBrowse<CR>
nnoremap <Leader>gp :Dispatch! git push<CR>
nnoremap <Leader>gP :Dispatch! git pull<CR>
nnoremap <Leader>gu :Git update<CR>
nnoremap <Leader>gC :Git checkout<space>
nnoremap <Leader>gv :GV<CR>
nnoremap <Leader>gV :GV!<CR>
nnoremap <leader>db :diffg BASE<CR>
nnoremap <leader>dl :diffg LOCAL<CR>
nnoremap <leader>dr :diffg REMOTE<CR>

" FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"

" Search for files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Search for only file content
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
  \   <bang>0) \   fzf#vim#with_preview(), <bang>0)

" Search
nmap <leader>sc :Commands<cr>
nmap <leader>sB :BLines<cr>
nmap <leader>sb :Buffers<cr>
nmap <leader>sf :Files<cr>
nmap <leader>sF :Rg<cr>

" Buffers
nmap <leader>bd :bd<cr>
nmap <leader>bf :bfirst<cr>
nmap <leader>bl :blast<cr>
nmap <leader>bn :bnext<cr>
nmap <leader>bp :bprev<cr>

" Tabs
nmap <leader>tc :tabnew<cr>
nmap <leader>tn :bnext<cr>
nmap <leader>tp :bprev<cr>

" CoC
" Navigate between suggest list
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-j>" :
      \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <C-j> for jump to next placeholder
let g:coc_snippet_next = '<c-l>'

" Use <C-k> for jump to previous placeholder
let g:coc_snippet_prev = '<c-h>'

" Use <cr> to confirm completion
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Open file explorer
nmap <leader>e :CocCommand explorer --sources=file+<CR>

" GoTo code navigation
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

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>

" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

" Use `[h` and `]h` to navigate chunks
nmap [h <Plug>(coc-git-prevchunk)
nmap ]h <Plug>(coc-git-nextchunk)

" Manipulate chunks
nmap <leader>gi :CocCommand git.chunkInfo<CR>
nmap <leader>gH :CocCommand git.chunkUndo<CR>
nmap <leader>gh :CocCommand git.chunkStage<CR>

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])
command! JestInit :call CocAction('runCommand', 'jest.init')
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

nmap <Leader>rf <Plug>(coc-refactor)

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
