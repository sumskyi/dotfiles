set nocompatible

filetype off

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""Vundle begin
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" github:
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/apidock.vim'
Bundle 'gregsexton/gitv'
Bundle 'scrooloose/nerdtree'
Bundle 'csexton/rvm.vim'
Bundle 'sumskyi/snipmate-snippets'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'kchmck/vim-coffee-script'
Bundle 'skwp/vim-colors-solarized'
Bundle 'gerardc/vim-padrino'
Bundle 'garbas/vim-snipmate'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

Bundle 'vim-ruby/vim-ruby'

" vimscripts repos
Bundle 'bufexplorer.zip'
Bundle 'Color-Sampler-Pack'
Bundle 'taglist.vim'
Bundle 'L9'
Bundle 'ctrlp.vim'
Bundle 'matchit.zip'

" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""Vundle end

" call pathogen#runtime_append_all_bundles()

syntax on " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

set ruler
"set cmdheight=2

"statusline setup
set statusline=%f       "tail of the filename

"Git
set statusline+=%{fugitive#statusline()}
"set statusline+=[%{GitBranch()}]

"RVM
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}

"display a warning if fileformat isnt unix
"set statusline+=%#warningmsg#
"set statusline+=%{&ff!='unix'?'['.&ff.']':''}
"set statusline+=%*

"Display a warning if file encoding isnt utf-8
"set statusline+=%#warningmsg#
"set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
"set statusline+=%*

"set statusline+=%h "help file flag
"set statusline+=%y "filetype
"set statusline+=%r "read only flag
"set statusline+=%m "modified flag

"display a warning if &et is wrong, or we have mixed-indenting
"set statusline+=%#error#
"set statusline+=%{StatuslineTabWarning()}
"set statusline+=%*
"
"set statusline+=%{StatuslineTrailingSpaceWarning()}
"
"set statusline+=%{StatuslineLongLineWarning()}
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"display a warning if &paste is set
"set statusline+=%#error#
"set statusline+=%{&paste?'[paste]':''}
"set statusline+=%*

set statusline+=%= "left/right separator

"set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight

set statusline+=%c, "cursor column
set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
set laststatus=2

"turn off needless toolbar on gvim/mvim
"set guioptions-=T

set autoindent

set gfn=Misc\ Fixed\ 11

if has("gui_running")
    "colorscheme darkblue2
    "colorscheme tabula
    set background=dark
    colorscheme solarized
else
    colorscheme relaxedgreen
    "murphy
    "darkblue
endif

"set shiftwidth=4
"set softtabstop=4
"set tabstop=4
"set smarttab

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

":autocmd FileType yaml set expandtab ts=2 sw=2
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType php set omnifunc=phpcomplete#CompletePHP shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType javascript set shiftwidth=4 softtabstop=4 tabstop=4 smarttab

au BufNewFile,BufRead *.rabl set filetype=ruby
au BufNewFile,BufRead *.yajl set filetype=ruby
"au BufNewFile,BufRead *.rb setlocal filetype=ruby-rails.ruby syntax=ruby
"au BufNewFile,BufRead *_spec.rb setlocal filetype=ruby-rspec.ruby syntax=ruby

:se nu

set modeline
set modelines=5


set ignorecase
set smartcase
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>


" source ~/.vim/vimrc

nnoremap <c-p> :NERDTreeToggle<CR>

let g:ctrlp_map = '<c-f>'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|vendor$'

"nnoremap <c-f> :FufFile<CR>
nnoremap <c-f> :CtrlP<CR>
"nnoremap <c-b> :FufBuffer<CR>
nnoremap <c-b> :CtrlPBuffer<CR>

"nnoremap <c-t> :FufTaggedFile<CR>

lang en_US.UTF-8

set noerrorbells
set visualbell
set t_vb=

:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

let g:syntastic_enable_signs=1
let g:rails_menu=1

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set foldmethod=syntax
set nofoldenable

set colorcolumn=80
