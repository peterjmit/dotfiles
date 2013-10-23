" Make it beautiful - colors and fonts

" http://ethanschoonover.com/solarized/vim-colors-solarized
colorscheme solarized
set background=dark

" Highlight line and column
set cursorline

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  set guifont=Source\ Code\ Pro:h14
else
  "dont load csapprox if we no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1
  " performance tweaks
  set noshowmatch
  set nocursorcolumn
  set lazyredraw
  set scrolljump=8
  let html_no_rendering=1
endif
