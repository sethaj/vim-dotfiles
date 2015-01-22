" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Jul 18
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
"if v:progname =~? "evim"
"  finish
"endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"set autoindent		" always set autoindenting on
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
" THESE BACKUPS ARE MAKING ME CRAZY LITTERING EVERYWHERE WITH THIER LITTLE ~
" FILES!  ENOUGH! AH AH. right.  and than one day I do something stupid and 
" overwrite an important file now its gone.
"
" But then, much later, I am once again driven insane by ~ files.  I can't
" remember this so called 'important file' I overwrote, so I comment out the
" above thereby insuring that I will someday overwrite an important file
" again.
endif

" set tabstop and shiftwidth to 4, hopefully this works....
"set tabstop=4
"set shiftwidth=4

" from http://www.jwz.org/doc/tabs-vs-spaces.html
" to get vim to interfret tab as an 'indent' command, similar to emacs (spaces) instead of an insert-a-tab command:
set softtabstop=2
" to set the mod-N indentation used when you hit the tab key in vim (what emacs call c-basic-offset), do this:
set shiftwidth=2
" to cause the TAB file-character to be displayed as mod-N in vi and vim (what emacs calls tab-width), do this:
set tabstop=2
" to cause TAB characters to not be used in the file fore compression, and for only spaces to be used (what emacs calls indent-tabs-mode), do this:
set expandtab


set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

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
  "filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" template toolkit syntax
au BufRead,BufNewFile *.tt  set filetype=tt

" NERD tree short cut (control + n)
map <silent> <c-n> :NERDTreeToggle<CR>
"nmap <F2> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" line numbers on
set number
" gutter
set numberwidth=3
" color
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
"highlight LineNr term=bold cterm=NONE ctermfg=Black ctermbg=NONE gui=NONE guifg=Black guibg=NONE
" OR - numbers off
"set nonumber


if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
  augroup END
endif
syntax on

" for python, do 4 space tabs
filetype plugin indent on
" in ~/.vim/after/ftplugin/python.vim
" setlocal expandtab
" setlocal shiftwidth=4
" setlocal softtabstop=4

" pathogen to manage packages: http://github.com/tpope/vim-pathogen
call pathogen#infect() 


" toggle autoindent to cut paste code
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

"colorscheme wombat
"colorscheme grb256
colorscheme ir_black


" mojo DATA syntax highlighting
let mojo_highlight_data = 1

