" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2006 Aug 12
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In an xterm the mouse should work quite well, thus enable it.
" set mouse=a

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

let Tlist_Use_Right_Window = 1
nnoremap <silent> <F8> :TlistToggle<CR>

set foldenable
set foldmethod=manual

let perl_fold = 1



map <F2> :NERDTreeToggle<CR>

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent
set nobackup
set nonumber
" let python_highlight_all = 1
" autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType python setlocal completeopt-=preview

execute pathogen#infect() 
execute pathogen#helptags() 


" let python_highlight_all = 1
" autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType python setlocal completeopt-=preview


let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0
let g:jedi#auto_initialization = 0

let g:ycm_goto_buffer_command = 'new-or-existing-tab'
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <leader>bl :PymodeLint<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

let g:pymode_folding = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_options_max_line_length = 150
let g:pymode_rope_goto_definition_cmd = 'new'
let g:pymode_rope_completion = 0
let g:pymode_lint_ignore = "E501"

" color of the current tag in the status line (bold cyan on black)
highlight User1 gui=bold guifg=cyan guibg=black
" color of the modified flag in the status line (bold black on red)
highlight User2 gui=bold guifg=black guibg=red
" the status line will be displayed for every window
set laststatus=2
" set the status line to display some useful information
set stl=%-f%r\ %2*%m%*\ \ \ \ %1*%{TagInStatusLine()}%*%=[%l:%c]\ \ \ \ [buf\ %n]
set termguicolors
" let ayucolor="mirage" 
" colorscheme ayu
set background=dark
colorscheme deus
