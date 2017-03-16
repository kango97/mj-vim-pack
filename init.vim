" ****************************************************
"             Command list of mjVimPack
"
" ****** Normal Mode ******
" hjkl  : Left Down Up Right
" i     : enter insert mode in front of the cursor.
" I     : enter insert mode in front of the line.
" a     : enter insert mode at back of the cursor.
" A     : enter insert mode at back of the line.
" o     : enter insert mode with new line below.
" O     : enter insert mode with new line above.
" x     : delete one character at the cursor.
" X     : delete one character in front rf the cursor.
" w     : move the cursor to the head of a next word.
" e     : move the cursor to the tail of a next word.
" d     : delete. It is used with other command. e.g.)'d5w' is deleting five words. 
" dd    : delete an entire line.
" yy    : yank. Copy an entire line.
" u     : undo.
" <Ctrl>r : redo.
" <Ctrl>d : down. Cursor down.
" <Ctrl>u : up. Cursor up.
" <Ctrl>f : front. Cursor down more than <Ctrl>d.
" <Ctrl>b : back. Cursor up more than <Ctrl>u.
" gg    : Move the cursor to the first line.
" G     : Move the curosr to the last line.
" <n>G  : Move the cursor to the <n> line. e.g.) '100G' moves the cursor to the 100nd line.
" /<str>: Find <str>. e.g.) '/abcd' finds 'abcd' in the file.
" $     : Move the cursor to the end of the line.
" ^     : Move the cursor to the end of the line.
" <Ctrl>ww : traverse windows.
" <Ctrl>wh : move to the left window.
" <Ctrl>wj : move to the below window.
" <Ctrl>wk : move to the above window.
" <Ctrl>wl : move to the right window.
"
" ****** Insert Mode ******
" <tab> : Automatically completing the code. e.g.) main<tab>, for<tab>
"         while<tab>, etc...
"         This is provided by UltiSnips the plugin.
"         You can see the snippets at below location.
"         '~/.vim/bundle/vim-snippets/snippets/c.snippets'
"
" ****** Command Mode ******
" :q    : quit the vim.
" :w    : save the opened file.
" :wq   : save the opened file and quit.
" :e <fileName> : open 'filename'. If it is not exists, vim makes a new file.
" :!<terminalCommand> : You can use termianl with !. e.g.):!ls         
" :sp   : split the window with horizontal side.
" :vs   : split the window with vertical side.
" :%s/oldStr/newStr/g   : change all oldStr to newStr e.g.) :%s/joeun/mjae/g
"
" ** Plugin Command **
" <F2>  : paste mode toggle. Indentation is disabled.
" <F4>  : Goyo toggle. You can use distract-free mode.
" <F5>  : colorscheme is changed to Solarized. If you would like to back, restart the vim.
" <leader>ne : NERDTree toggle. <ledaer> is ','. e.g.),ne
" <leader>c<space> : NERDCommenter toggle. Comment made.
" <ledaer>cs       : NERDCommenter. Sexy comment.
"
" <Ctrl>n : multiple cursor. Select next
" <Ctrl>p : multiple cursor. Go to previous one.
" <Ctrl>x : multiple cursor. Skip this one.
"           When multiple cursors are selected, push 'xi' if you want to replace the text, 
"           or push 'I' to insert texts in front of the cursor,
"           or Push 'A' to attach texts at back of the cursor.
"
" ****************************************************



" Vundle Setting
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'The-NERD-Tree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Syntastic'
Plugin 'Rip-Rip/clang_complete'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
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


"" Basic Settings
syntax on
set number
set relativenumber
set hlsearch
set ignorecase
set ts=4
set et
set sw=4
set termguicolors
set guioptions-=r
set scrolloff=5
set background=dark
colorscheme CodeSchool3
" colorscheme solarized
autocmd FileType make setlocal noexpandtab

let mapleader = ","
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nnoremap <F4> :Goyo <CR>

function ChangeColorToSolarizedDark()
   colo solarized
   set background=dark
endfunction
nnoremap <F5> :call ChangeColorToSolarizedDark() <CR>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>} :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>{ :exe "vertical resize " . (winheight(0) * 2/3)<CR>

nnoremap <silent> <Leader>= :exe "resize +3"<CR>
nnoremap <silent> <Leader>- :exe "resize -3"<CR>
nnoremap <silent> <Leader>] :exe "vertical resize +8"<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize -8"<CR>

"" The-NERD-Tree
autocmd BufEnter * lcd %:p:h
autocmd VimEnter * if !argc() | NERDTree | endif
nmap <leader>ne :NERDTreeToggle<cr>

let NERDTreeShowLineNumbers=1
let g:NERDTreeWinPos = "right"

"" vim-airline
" Turning on buffer list
let g:airline#extensions#tabline#enabled = 1 
" do not show a directory of the file which is opened in the buffer
" let g:airline#extensions#tabline#fnamemod = ':t'

autocmd VimEnter * AirlineTheme hybrid
set laststatus=2

"" vim-smooth-scroll
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 5)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 3)<CR>

"" vim-multiple-cursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -pedantic"
let g:syntastic_c_compiler_options = "-Wall -pedantic"

"" clang_complete
let g:clang_library_path='/usr/lib/x86_64-linux-gnu'
set completeopt-=preview

"" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

"" Use deoplete.
let g:deoplete#enable_at_startup = 1

"" NERD_commenter
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

"" Goyo
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

"" delimitMate
let delimitMate_expand_cr=1
