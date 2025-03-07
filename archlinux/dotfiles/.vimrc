" .vimrc of Iury Adones  {iuryadones@gmail.com}                            {{{1
" vim: set foldmethod=marker:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Iury Adones <iuryadones@gmail.com>
" Last change:  2018 march 10
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc

set nocompatible

filetype indent off
filetype off
filetype plugin off

syntax clear
syntax off

let mapleader=" "
let g:mapleader=" "
let s:home=$HOME
let s:vimhome=s:home."/.vim"
let s:plugdir=s:vimhome."/plugged"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug                                                                 {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin(s:plugdir)

    function! BuildYCM(info)
      " info is a dictionary with 3 fields
      " - name:   name of the plugin
      " - status: 'installed', 'updated', or 'unchanged'
      " - force:  set on PlugInstall! or PlugUpdate!
      if a:info.status == 'installed' || a:info.force
        !./install.py --system-libclang --all
      endif
    endfunction

    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
      Plug 'Shougo/neosnippet'
      Plug 'Shougo/neosnippet-snippets'
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'Shougo/neosnippet'
      Plug 'Shougo/neosnippet-snippets'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif

    Plug 'SirVer/ultisnips'
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    Plug 'davidhalter/jedi-vim'
    Plug 'ervandew/supertab'
    Plug 'honza/vim-snippets'
    Plug 'iuryxavier/vim-simple-tex-fold'
    Plug 'iuryxavier/vim-syntax'
    Plug 'lambdalisue/vim-pyenv'
    Plug 'mhinz/vim-startify'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'tpope/vim-commentary'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

call plug#end()
autocmd VimEnter *
     \ if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
     \ | PlugInstall | q
     \ | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default Config                                                            {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype on
filetype plugin on
filetype indent on

set autoindent
set autoread
set autowrite
set autowriteall
set backspace=indent,eol,start
set binary
set bomb
set cmdheight=2
set colorcolumn=80
set columns=80
set completeopt=menu,menuone
set complete-=i
set confirm
set copyindent
set cursorline
set display=truncate
set encoding=utf-8
set expandtab
set fileformats=unix,dos,mac
set foldmethod=marker
set history=2000
set hlsearch
set laststatus=1
set lazyredraw
set linespace=0
set magic
set modeline
set nobackup
set noerrorbells
set noexrc
set nohidden
set noignorecase
set nojoinspaces
set noswapfile
set nowritebackup
set nrformats-=octal
set number relativenumber
set pumheight=20
set ruler
set scrolloff=20
set secure
set shell=/usr/bin/zsh
set shiftwidth=4
set shortmess=at
set showcmd
set showmatch
set showmode
set showtabline=3
set sidescroll=6
set smartindent
set softtabstop=0
set splitbelow
set splitright
set synmaxcol=200
set tabstop=4
set textwidth=80
set title
set ttimeout
set ttimeoutlen=0
set ttyfast
set wildmenu

redraw

syntax sync minlines=1
syntime on

if has('nvim')
  set inccommand=split
endif

if has('reltime')
  set incsearch
endif

if has('win32')
  set guioptions-=t
endif

if has('mouse')
  set mouse=a
endif

if has("autocmd")
  filetype plugin indent on
  augroup vimStartup
    au!
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
  augroup END
endif

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  set nolangremap
endif

if has('persistent_undo')
  set undofile
endif

if has("autocmd")
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=80
  augroup END
else
  set autoindent
endif

if has('syntax') && has('eval')
  if has('nvim')
    runtime! macros/matchit.vim
  else
    packadd! matchit
  endif
endif

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set fileencoding=utf-8
    set fileencodings=utf-8,latin1
endif

if has("nvim")
    au TermOpen * setlocal number relativenumber
endif

augroup save
  au!
  au FocusLost * wall
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clipboard                                                                {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('unamedplus')
  set clipboard=unnamed,unamedplus
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorsheme                                                               {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

try
    colorscheme vim-syntax
catch
    colorscheme default
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions and Commands                                                   {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" open large files > 10 MB
let g:LargeFile = 10 * 1024 * 1024

augroup LargeFile
  " files with filesize too large are recognized too (getfsize = -2)
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile ||
    \ f == -2 | call LargeFile() | endif
augroup END

function! LargeFile()
    set eventignore+=FileType " no syntax highlighting etc
    setlocal bufhidden=unload " save memory when other file is viewed
    setlocal undolevels=-1 " no undo possible
    setlocal foldmethod=manual
    setlocal noswapfile
endfunction

" Based on window movement shortcuts by 'nicknisi/dotfiles'
function! WinCreate(key)
  if (match(a:key,'[jk]'))
    wincmd v
  else
    wincmd s
  endif
  if (match(a:key,'[kh]'))
    exec "wincmd ".a:key
  endif
  if isdirectory(s:vimhome)
      if has('Startify')
        Startify
      endif
  endif
endfunction

" Compile Python, C++ e C
function! CompileFile()
    if (match(bufname('%'),'.py$') > 1)
        term python %
    endif
    if (match(bufname('%'),'.cpp$') > 1)
        term g++ % -o %.o; ./%.o
    endif
    if (match(bufname('%'),'.c$') > 1)
        term gcc % -o %.o; ./%.o
    endif
    if (match(bufname('%'),'.tex$') > 1)
        term pdflatex -synctex=1 -interaction=nonstopmode %
    endif
endfunction

let g:ulti_expand_or_jump_res=0
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction

function Count(word)
    let count_word = "%s/" . a:word . "//gn"
    execute count_word
    echo a:word
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping                                                                  {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

for prefix in ['n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Sorting lines
vnoremap <Leader>ss :%sort<CR>
vnoremap <Leader>su :%sort u<CR>

" Count current word
nmap <Leader>w <Esc>:call Count(expand("<cword>"))<CR>

" Open Terminal 
nnoremap <Leader>st      :vsplit +terminal<cr>
nnoremap <Leader>ht      :split +terminal<cr>

" editing nvim
nnoremap <Leader>ev :vsplit ~/.vimrc<CR>
nnoremap <Leader>sv :source ~/.vimrc<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <Leader>tt :tabnew<CR>

" Simplify Leader mappings Clipboard
noremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" NERDTreeToggle open/close
nnoremap <Leader><Leader> <ESC>:NERDTreeToggle<CR>

" Python, C++ e C
nnoremap <F5> <ESC>:call CompileFile()<CR>
inoremap <F5> <ESC>:call CompileFile()<CR>

" Visual com Python
vnoremap <F5> :!python<CR>

" terminal-mode
tnoremap <Esc> <C-\><C-n>

" folding short cut
nnoremap <Leader>o za

" no highlighting
nnoremap <leader><cr> :noh<cr>

" Simplify shortcut for creating windows
nnoremap <Leader>h :call WinCreate('h')<CR>
nnoremap <Leader>j :call WinCreate('j')<CR>
nnoremap <Leader>k :call WinCreate('k')<CR>
nnoremap <Leader>l :call WinCreate('l')<CR>

" move line [down|up], with Alt+Shift+[j|k]
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" move line [down|up], with Control+Shift+[Down|Up]
nnoremap <C-S-Down> :m .+1<CR>==
nnoremap <C-S-Up> :m .-2<CR>==
inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
vnoremap <C-S-Up> :m '<-2<CR>gv=gv

map <F7> :if exists("g:syntax_on") <Bar>
    \   highlight clear <Bar>
    \   syntax clear <Bar>
    \   syntax off <Bar>
    \ else <Bar>
    \   colorscheme iaxs-monokai <Bar>
    \ endif <CR>

" UtilSnips Trigger
inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configs Vim Plug                                                         {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup=1
let g:deoplete#auto_complete_delay=0
let g:deoplete#auto_complete_start_length=1

let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger='<C-R>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'

let g:SuperTabDefaultCompletionType='<C-n>'

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_max_num_candidates=0
let g:ycm_max_num_identifier_candidates=0
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_python_binary_path='python'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_server_python_interpreter='python'
let g:ycm_use_ultisnips_completer=1

let g:jedi#auto_initialization=1
let g:jedi#auto_vim_configuration=0
let g:jedi#completions_command=""
let g:jedi#completions_enabled=0
let g:jedi#popup_on_dot=1
let g:jedi#show_call_signatures="1"
let g:jedi#show_call_signatures_delay=0
let g:jedi#smart_auto_mappings=0

autocmd FileType nerdtree setlocal number relativenumber

if exists('g:jedi')
  if jedi#init_python()
    function! s:jedi_auto_force_py_version() abort
      let major_version = pyenv#python#get_internal_major_version()
      call jedi#force_py_version(major_version)
    endfunction
    augroup vim-pyenv-custom-augroup
      au! *
      au User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
      au User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
    augroup END
  endif
endif

