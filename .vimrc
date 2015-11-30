set nocompatible
set shell=/bin/bash

"Set leader to be space and remove default space functionality
let mapleader = " "
nnoremap <SPACE> <Nop>

filetype off "required by vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where VUndle should install plugins
" call vundle#begin*('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"fugitive for git integration
Plugin 'tpope/vim-fugitive'

"vim_proc
Plugin 'Shougo/vimproc.vim'

"unite for file selection pane
Plugin 'Shougo/unite.vim'

"Color schemes
Plugin 'flazz/vim-colorschemes'

"File browser tree
Plugin 'scrooloose/nerdtree'

"Git gutter
Plugin 'airblade/vim-gitgutter'

"Syntax checker
Plugin 'scrooloose/syntastic'

"Buffer gator buffer explorer
Plugin 'jeetsukumaran/vim-buffergator'
 
"Tag list
Plugin 'majutsushi/tagbar'

"molokai theme
Plugin 'tomasr/molokai'

"airline
Plugin 'bling/vim-airline'

call vundle#end() "required

"Brief Bundle Help
" :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdatei
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

filetype plugin indent on 

" Enable syntax highlighting
syntax on

" Set color scheme
colorscheme 256-jungle  
"let g:molokai_original = 1
"let g:rehash256 = 1

set guioptions-=T
set guioptions-=m

set noswapfile

"Configure unite
let g:unite_source_grep_command = 'grep'
let g:unite_source_grep_default_opts = ''
let g:unite_source_grep_recursive_opt = ''
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
let g:unite_source_rec_async_command= 'ag --follow --nocolor --nogroup -g ""'
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
map <c-p> :Unite -start-insert -buffer-name=files file_rec/async<CR>

"map <C-S-p> :Unite -smartcase grep:.<CR>

"Configure GitGutter plugin
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_sign_column_always = 0

highlight SignColumn ctermbg=black
highlight SignColumn guibg=black
highlight GitGutterAdd guifg=green
highlight GitGutterChange guifg=green
highlight GitGutterDelete guifg=red
highlight GitGutterChangeDelete guifg=red

"Configure NERDTree
let NERDTreeQuitOnOpen=1
nnoremap <S-p> :NERDTreeToggle<CR>

"Configure BufferGator
nnoremap <S-b> :BuffergatorToggle<CR>

"Configure tagbar
nnoremap <S-f> :TagbarToggle<CR>

"Configure airline
let g:airline#extensions#tabline#enabled = 0

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set nowrap

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set novisualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
"set shiftwidth=2
"set softtabstop=2
se scrolloff=5

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
set tabstop=2
set expandtab
set softtabstop=2

"------------------------------------------------------------
" Mappings {{{1876
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
"nnoremap <C-L> :nohl<CR><C-L>

"------------------------------------------------------------
"
"Map control-b to create split horizontally
map <c-b> :split<CR>
"Map control-g to create split vertically
map <c-g> :vsplit<CR>
"Map control-h to move to top/leftmost window
nnoremap <c-h> :wincmd W<CR>
"Map control-l to move to bottom/rightmost window
nnoremap <c-l> :wincmd w<CR>

nnoremap <C-j> <C-w>=

"Map control-w to close current window (or quit)
map <c-w> :q<CR>

"Map control-s to save (requires 'stty -ixon' in .bashrc to prevent locking over
"ssh) 
map <c-s> :w<CR>

"Wrap to the next/previous line when reaching beginning/end of line with
"keyboard navigation
set whichwrap+=<,>,h,l,[,]

"Map control-P to show Unite file explorer

"Implement standard clipboard key mappings (ctrl+c, ctrl+v, etc)
"for normal copy/paste
vnoremap <C-c> "+y
"vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
vnoremap <C-x> +d<Esc>i
nnoremap <C-v> "+pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui
map <C-y> :red<CR>

"Automatically add closing curly brackets
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

"Map control-m to jump between matching brackets
map <c-m> %

nnoremap <C-n> :tabnew<CR>
nnoremap <C-tab> :tabnext<CR>
nnoremap <C-S-tab> :tabprevious<CR>

"nnoremap <silent> <esc> :nohl <return><esc>

if has('autocmd')
 au BufWritePost .vimrc source $MYVIMRC | AirlineRefresh
endif




