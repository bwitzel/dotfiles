" Auto reload of .vimrc
autocmd! bufwritepost .vimrc source %

" necessary to enable tab-completion
set nocompatible

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" enable mouse
set mouse=a

" bind movement keys for windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" sort function shortcut
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" enable syntax highlighting
filetype off
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
syntax on

" showing line numbers and length
" TOTO: only turn this on for .py files...
set number
set tw=79
set nowrap
set fo-=t    " no autowrap
set colorcolumn=80
highlight ColorColumn ctermbg=233

" tabstops
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" use pathogen to manage plugins
execute pathogen#infect()

" settings for vim-powerline
set laststatus=2

" settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" settings for python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" better navigation through omnicomplete option list
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Mark trailing whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s+$/

" color scheme
set t_Co=256
colorscheme wombat256mod

" python folding
set nofoldenable

" make search case insensitive and easier to locate
set hlsearch
set incsearch
set ignorecase
set smartcase

