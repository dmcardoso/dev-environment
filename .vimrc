" https://github.com/filipedeschamps/dotfiles/blob/master/.vimrc

" FILE NUMBERS
" Enable relative and absolute file numbers
set number

" AUTO IDENTATION
" Enable auto identation with 'spaces' instead of 'tabs'
set smartindent
set expandtab
set softtabstop=4
set shiftwidth=4

" SYNTAX
" Enable syntax highlighting
syntax on

" BACKUP
" Disable all backup files, never used them
set nobackup
set nowritebackup
set noswapfile

" WRAP
" Stop wrapping long lines
set nowrap

" REMEMBER THIGS
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

