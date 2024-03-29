""" Mabezdev nvim config

let mapleader = "\<Space>" " set the leader key to space

call plug#begin()

" Fuzzy search/find
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Completion plugins
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'w0rp/ale'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Semantic language support
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp', { 'do': 'pip install --user --break-system-packages -r requirements.txt' }

" Syntactic language support
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Nerd tree for projects
Plug 'scrooloose/nerdtree'

" color schemes
Plug 'patstockwell/vim-monokai-tasty'
Plug 'dylanaraps/wal.vim'

" light line for status
Plug 'itchyny/lightline.vim'

" gdb support
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

call plug#end()

" rg support
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif


" Permanent undo
set undodir=~/.config/nvim/vimdid
set undofile

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Linter
let g:ale_sign_column_always = 1
" only lint on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_virtualtext_cursor = 0

"let g:LanguageClient_autoStart = 1



" use netrw like nerd tree for basic project exploration : https://shapeshed.com/vim-netrw/
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 6 
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" nerdtree

" close vim if nerdtree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" when opening a folder, open nerdtree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" show hidden files in nt
let NERDTreeShowHidden=1

" MD
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

" open a file in the project
map <C-p> :Files<CR>

" editor settings

" get syntax 
syntax on

" unbind the arrow keyes when in command mode to force myself to use hjlk
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Ctrl+c and Ctrl+j as Esc
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" enable mouse support
set mouse=a

" yank to clipboard
set clipboard=unnamedplus

" show or hide nerdtree with c-b
map <C-b> :NERDTreeToggle<CR>


" file type detection 
autocmd BufRead *.md set filetype=markdown

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" Jump to next/previous error
nnoremap <C-j> :cnext<cr>
nnoremap <C-k> :cprev<cr>

" lang server stuff
"nnoremap <silent> K :ALEHover<CR>
"nnoremap <silent> gd :ALEGoToDefinition<CR>
nmap <silent> E <Plug>(coc-diagnostic-prev)
nmap <silent> W <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


""" GUI Settings

set ttyfast
set showcmd " Show (partial) command in status line.
"color scheme, old: vim-monokai-tasty
colorscheme wal
" numbering system
set number

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
