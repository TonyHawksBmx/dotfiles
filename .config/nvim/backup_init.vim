set number
set relativenumber
set tabstop=4
set shiftwidth=4
set autoindent
set mouse=a
colorscheme slate
"colorscheme desert

filetype plugin indent on
set encoding=utf-8
"set expand tab
syntax on

"Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree

nnoremap <C-n> :NERDTreeFocus <CR>
"nnoremap <leader>n :NERDTree
nnoremap <leader>] :NERDTreeToggle <CR>
"nnoremap <C-f> :NERDTreeFind


call plug#begin()
"List Plugins here:
Plug 'petertriho/nvim-scrollbar'
Plug 'preservim/nerdtree'
Plug 'neovim/nvim-lspconfig'
Plug 'SmiteshP/nvim-navic'

call plug#end()

":PlugInstall to install the plugins
":PlugUpdate to install or update the plugins
":PlugDiff to review the changes from the last update
":PlugClean to remove plugins no longer in the list
