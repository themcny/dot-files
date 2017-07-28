set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mru.vim'
Plugin 'Align'
Plugin 'darthmall/vim-vue'
Plugin 'yalesov/vim-emblem'
Plugin 'sheerun/vim-polyglot'

call vundle#end()
filetype plugin indent on

"turn off the bell
set vb
set t_vb=

set number
set nowrap

"indent and tabs
set softtabstop=0
set shiftwidth=2
set tabstop=2

set expandtab

set ignorecase
set smartcase
set runtimepath^=~/.vim/bundle/ctrlp.vim

set list

"pry
iabbr rpry require 'pry-byebug'; binding.pry; puts "debugger should stop here"
