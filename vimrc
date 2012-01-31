syntax off
filetype off
call pathogen#infect()
filetype off
syntax on
filetype plugin indent on

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
"
"
"	    The h and l keystrokes can be made to wrap over lines (so that trying
"	    to move left past the beginning of a line puts the cursor at the end
"	    of the line above). This command does that, and also allows ~ (convert
"	    case) to wrap over lines, and the cursor keys to wrap when in insert
"	    mode:
set whichwrap=h,l,~,[,]
"       The % keystroke is useful for bouncing around pairs of various sorts
"       of brackets. It can be made to work for angled brackets as well:
set matchpairs+=<:>

" When started as "evim", evim.vim will already have done these settings.
set expandtab
set shiftwidth=4
set tabstop=4

syntax on

set backupdir=./.backup,~/tmp/vim_bak
set directory=./.backup,~/tmp/vim_bak

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

" font
  if has("gui_running")
        if has("gui_gtk2")
            set guifont=Courier\ New\ 9
        elseif has("x11")
            set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
        else
            set guifont=Courier_New:h9:cDEFAULT
        endif
    endif

syn sync minlines=50
map <C-j> :syn sync fromstart<Enter>
" 'quote' a word
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
" " double "quote" a word
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
" " remove quotes from a word
nnoremap qe :silent! normal mpeld bhd `ph<CR>

hi MatchParen cterm=underline ctermbg=none ctermfg=red

" Allow to use w!! to write a file using sudo if you forgot to sudo vim file.
cmap w!! %!sudo tee > /dev/null %


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_highlighting = 2
let g:syntastic_quiet_warnings=1

" highlight tabs and trailing spaces
set listchars=tab:>-,trail:-
set list


set ls=2 " Always show status line
if has('statusline')
   " Status line detail:
   " %f     file path
   " %y     file type between braces (if defined)
   " %([%R%M]%)   read-only, modified and modifiable flags between braces
   " %{'!'[&ff=='default_file_format']}
   "        shows a '!' if the file format is not the platform
   "        default
   " %{'$'[!&list]}  shows a '*' if in list mode
   " %{'~'[&pm=='']} shows a '~' if in patchmode
   " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
   "        only for debug : display the current syntax item name
   " %=     right-align following items
   " #%n    buffer number
   " %l/%L,%c%V   line number, total number of lines, and column number
   function SetStatusLineStyle()
      if &stl == '' || &stl =~ 'synID'
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=#%n %l/%L,%c%V "
      else
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V "
      endif
   endfunc
   " Switch between the normal and vim-debug modes in the status line
   nmap _ds :call SetStatusLineStyle()<CR>
   call SetStatusLineStyle()
   " Window title
   if has('title')
      set titlestring=%t%(\ [%R%M]%)
   endif
endif 

" 2-space indentation for coffeescript
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab tabstop=2
au BufNewFile,BufReadPost *.sass setl shiftwidth=2 expandtab tabstop=2

" Eclim mappings
nnoremap <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <leader>i :JavaImport<cr>
