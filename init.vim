set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" The NERD Tree
Plugin 'The-NERD-Tree'

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" vim-smooth-scrolling
Plugin 'terryma/vim-smooth-scroll'
" vim-multiple-cursor
Plugin 'terryma/vim-multiple-cursors'
" Auto-Paris
"Plugin 'Auto-Pairs'
" Syntastic
Plugin 'Syntastic'
" neocomplete
"Plugin 'Shougo/neocomplete.vim'
" neocomplete for neovim
Plugin 'Shougo/deoplete.nvim'
" vim-clang (alternative for clang_complete)
"Plugin 'justmao945/vim-clang'
" clang_complete
Plugin 'Rip-Rip/clang_complete'
" NERD_commenter
Plugin 'scrooloose/nerdcommenter'
" delimitMate
Plugin 'Raimondi/delimitMate'
" Goyo
Plugin 'junegunn/goyo.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


syntax on
filetype plugin on
set nu
set hlsearch
set ignorecase
set ts=4
set et
autocmd FileType make setlocal noexpandtab
set sw=4
"set guifont=Monoid\ Retina:h14
"set guifont=Source\ Code\ Pro\ ExtraLight:h14
set termguicolors

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
" nnoremap <F4> :set invnu number?<CR>
" set showmode
nnoremap <F4> :Goyo <CR>
let mapleader = ","
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

colorscheme CodeSchool3
set guioptions-=r

autocmd BufEnter * lcd %:p:h
autocmd VimEnter * if !argc() | NERDTree | endif

let mapleader = ","
nmap <leader>ne :NERDTreeToggle<cr>
let NERDTreeShowLineNumbers=1
let g:NERDTreeWinPos = "right"


" for vim-airline
" 버퍼 목록 켜기
let g:airline#extensions#tabline#enabled = 1

" 파일명만 출력
" let g:airline#extensions#tabline#fnamemod = ':t'

autocmd VimEnter * AirlineTheme hybrid

set laststatus=2
" vim-airline end
" vim-smooth-scroll
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 5)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 3)<CR>

" vim-multiple-cursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

set relativenumber



"for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler = 'g++'
" let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"

"NERD_commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" customize keymapping
map <Leader>cc <plug>NERDComToggleComment
map <Leader>c<space> <plug>NERDComComment
"NERD_commenter END


" resize windows
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>} :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>{ :exe "vertical resize " . (winheight(0) * 2/3)<CR>

nnoremap <silent> <Leader>= :exe "resize +3"<CR>
nnoremap <silent> <Leader>- :exe "resize -3"<CR>
nnoremap <silent> <Leader>] :exe "vertical resize +8"<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize -8"<CR>


" Use deoplete.
let g:deoplete#enable_at_startup = 1

" clang_complete
" let g:clang_library_path='/usr/lib/llvm-3.8/lib'
let g:clang_library_path='/usr/lib/x86_64-linux-gnu'
set completeopt-=preview


" Goyo Config
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set number
  set rnu
  " ...
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" Goyo End
