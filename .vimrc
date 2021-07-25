" 12.03.2021 from scratch..

set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
language en_US.utf8

colo desert
syntax on
se nocompatible
filetype plugin on
set belloff=all

" set guifont=Misc\ Fixed\ Regular\ 12
" set guifont=Source\ Code\ Pro\ Light
set guifont=Source\ Code\ Pro\ Regular
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf8



" ------------------------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
filetype off

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
nnoremap <c-p> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDSpaceDelims = 1
let NERDTreeRespectWildIgnore=1
let NERDTreeIgnore=['\.o$', '\~$', '\.swp$']

" [count]<leader>cc |NERDCommenterComment|
" [count]<leader>cn |NERDCommenterNested|
" [count]<leader>c<space> |NERDCommenterToggle|
" [count]<leader>cm |NERDCommenterMinimal|
" [count]<leader>ci |NERDCommenterInvert|
" [count]<leader>cs |NERDCommenterSexy|
" [count]<leader>cy |NERDCommenterYank|
" <leader>c$ |NERDCommenterToEOL|
" <leader>cA |NERDCommenterAppend|
" <leader>ca |NERDCommenterAltDelims|
" [count]<leader>cl |NERDCommenterAlignLeft
" [count]<leader>cb |NERDCommenterAlignBoth
" [count]<leader>cu |NERDCommenterUncomment|
Plugin 'scrooloose/nerdcommenter'

Plugin 'skwp/vim-colors-solarized'

Plugin 'Tagbar'
nmap <F8> :TagbarToggle<CR>

" Plugin 'roman/golden-ratio'
" Use this option to disable the autocommand events for golden ratio
" (on by default): 
"let g:golden_ratio_autocommand = 0
" Use this option to keep all windows that have 'nomodifiable' option set
" untouched (off by default): >
" let g:golden_ratio_exclude_nonmodifiable = 1
" nnoremap <F7> :GoldenRatioToggle<CR>

Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1

Plugin 'ctrlpvim/ctrlp.vim'
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_map = '<c-f>'
nnoremap <c-f> :CtrlP<CR>
nnoremap <c-b> :CtrlPBuffer<CR>
nnoremap <c-t> :CtrlPTag<CR>

let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_custom_ignore = '\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

Plugin 'syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" let g:syntastic_coffee_coffeelint_args = "--csv --file ~/coffeelint.json"
let g:syntastic_eruby_ruby_quiet_messages =
  \ {'regex': 'possibly useless use of a variable in void context'}

Plugin 'ElmCast/elm-vim'
let g:elm_syntastic_show_warnings = 1
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plugin 'gitv'
Plugin 'rking/ag.vim'
Plugin 'godlygeek/tabular'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-crystal/vim-crystal'

" Plugin 'tpope/vim-rvm'
" Plugin 'tpope/vim-bundler'
" Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'

Plugin 'tpope/vim-rails'
let g:Tlist_Ctags_Cmd = 'universal-ctags'

" Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround' " cs'" will change 'surround' to "surround"
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-projectionist'
" Bundle 'tpope/vim-dispatch'

" JS / ES6 / TypeScript / Prettier / etc
Plugin 'leafgarland/typescript-vim'
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
" autocmd FileType typescript :set makeprg=tsc

Plugin 'vim-ruby/vim-ruby'

Plugin 'evanleck/vim-svelte'
let g:svelte_preprocessors = ['typescript']

Plugin 'maxmellon/vim-jsx-pretty'

Plugin 'mlaursen/vim-react-snippets'

" WTF
" Plugin 'neoclide/coc-eslint'
" Plugin 'neoclide/coc-prettier'

Plugin 'matchit.zip'

call vundle#end()            " required
filetype plugin indent on    " required
" ------------------------------------------------------------------



if has("gui_running")
  set background=dark
  colorscheme solarized
else
  " colorscheme relaxedgreen
  " colorscheme molokai
  colorscheme desert
endif

se nu
se list
se listchars=tab:>-,trail:~,extends:>,precedes:<
se tabstop=2 shiftwidth=2 expandtab
se autoindent

se smarttab

se colorcolumn=80,120
highlight ColorColumn ctermbg=LightGray

set modeline
set modelines=5

set ignorecase
set smartcase
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set ruler

set laststatus=2
set backspace=indent,eol,start

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" C-W = " => resize to equal size
" split:   Ctrl-w + and Ctrl-w - (for a single row)
" vsplit:  Ctrl-w > and Ctrl-w < (for a single row)
" To resize all windows to equal dimensions based on their splits, you can use Ctrl-w =.
" To increase a window to its maximum height, use Ctrl-w _.
" To increase a window to its maximum width, use Ctrl-w |.
map <C-A> <C-W>_

set noerrorbells
set visualbell
set t_vb=

:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=*.o,*.obj,*~ "stuff to ignore when tab completing

set foldmethod=syntax
set nofoldenable

" this prevents cursor disappearing
set nomousehide

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif

if filereadable(expand("~/.vimrc.ocaml"))
  source ~/.vimrc.ocaml
endif



