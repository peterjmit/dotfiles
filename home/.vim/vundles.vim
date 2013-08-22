" ==============================================
" Vim plugin configuration (via Vundle)
" borrowed from https://github.com/skwp/dotfiles
" ==============================================
"
" Run vundle update by issuing the command :BundleInstall from within vim
" or directly invoking it from the command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

" Look and feel
Bundle "bling/vim-airline"
Bundle "altercation/vim-colors-solarized"
Bundle "nathanaelkane/vim-indent-guides"

" Text editing improvements
Bundle "Shougo/neocomplcache"
Bundle "tomtom/tcomment_vim"
Bundle "terryma/vim-multiple-cursors"

" Filetype plugin indent on is required by vundle
filetype plugin indent on
