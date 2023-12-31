""""""""""""""""""""""
"""Nvim config file"""
""""""""""""""""""""""
" Save this file to ~/.config/nvim/init.vim

" Fixes weird character problem in some devel versions neovim under tmux sesssion. This might go away in future.
set guicursor=

" Enable mouse support
" set mouse=a


" Preferred default settings
set nowrap

" start R with F2 key
" map <F2> <Plug>RStart 
" imap <F2> <Plug>RStart
" vmap <F2> <Plug>RStart
" R version can be specified like this:
" let vimrplugin_r_path = "/opt/R/3.1.2-release/bin/R"
" Send selection or line to R with space bar, respectively.
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" Shortcut for R's assignment operator: 0 turns it off; 1 assigns underscore; 2 assigns two underscores
let R_assign = 2

" Ensures usage of your own ~/.tmux.conf file
let R_notmuxconf = 1

" Shows function arguments in a separate viewport during omni completion with Ctrl-x Ctrl-o:w
" let R_show_args = 1

" Use Ctrl-Space to do omnicompletion
" inoremap <C-Space> <C-x><C-o>

" Enable CoC
let g:coc_global_extensions = [ 
  \ 'coc-snippets',
  \ 'coc-python',
  \ 'coc-sh',
  \ 'coc-r-lsp',
  \ ]

" Use <Tab> for trigger completion and navigate the completion menu
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Use <S-Tab> to jump back in the completion menu
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Map CoC functions
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>f  <Plug>(coc-format-selected)




" Map <Space> to manually trigger autocompletion
inoremap <expr> <Space> AutoPairsToggle("<Space>")






" Spaces & Tabs {{{                                                                                                                                                                                                                                                                                                                                                                         
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent                                                                                                                                                                                                                                                                                                                                
set expandtab       " tabs are space                                                                                                                                                                                                                                                                                                                                                        
set autoindent                                                                                                                                                                                                                                                                                                                                                                              
set copyindent      " copy indent from the previous line                                                                                                                                                                                                                                                                                                                                    
" }}} Spaces & Tabs                                                                                                                                                                                                                                                                                                                                                                         
" Note: to toggle between spaces and tabs use:                                                                                                                                                                                                                                                                                                                                              
"   :set noexpandtab                                                                                                                                                                                                                                                                                                                                                                        
"   :set expandtab    

" Remove white background of status line at bottom of nvim viewport (default is 2)
set laststatus=1

"let R_in_buffer = 0
"let R_tmux_split = 1
"let R_applescript = 0
"let R_tmux_close = 0

" tgirke: For Latex work: open *.pdf files in evince/xpdf upon opening of *.tex files in vim                                                                                                                                                                                                                                                                                                
" more on this on this page: http://ubuntuforums.org/showthread.php?p=5351607                                                                                                                                                                                                                                                                                                               
" On Linux                                                                                                                                                                                                                                                                                                                                                                                  
au BufRead *.tex silent !evince %<.pdf 2>/dev/null &                                                                                                                                                                                                                                                                                                                                        
au BufRead *.Rnw silent !evince %<.pdf 2>/dev/null & 

" The following provides a zoom functionality, similar to Tmux's Ctrl-a z, by pressing 'gz' in normal mode. 
function ZoomWindow()
        let cpos = getpos(".")
        tabnew %
        redraw
        call cursor(cpos[1], cpos[2])
        normal! zz
    endfunction
    nmap gz :call ZoomWindow()<CR>

"""""""""""""""""""""
"""NERDTree Plugin"""
"""""""""""""""""""""
" Installation
"       - Download NERDTree plugin from here
"         http://www.vim.org/scripts/script.php?script_id=1658
"       - unzip nerdtree.zip -d ~/.vim
"
" Usage
"   - '?' opens quick help
"   - 'zz' opens and 'q' closes NERDTree ('zz 'requires setting below)
"       - 't' opens file in new tab
"       - 'T' opens file in new tab silently
"   - 'gt' and 'gT' switch between tabs
"       - 'm' opens menu mode for creating/deleting files, 'Ctrl-c' to exit out of this mode   
"
" Settings
" Opens NERDTree with custom shortcut, here 'zz'
let NERDTreeQuitOnOpen=1
let mapleader = "z" 
nmap <leader>z :NERDTreeToggle<cr>

" Instruct NERDTree to always opens in the current folder
"set autochdir
"let NERDTreeChDirMode=2
"nnoremap <leader>n :NERDTree .<CR>

" Optional to show special NERDTree browser characters properly (e.g. on remote linux system) 
let g:NERDTreeDirArrows=0

" Show bookmarks by default
let NERDTreeShowBookmarks=1
"""""""""""""""""""""""
syntax enable
set noswapfile
set number relativenumber
set scrolloff=7
set backspace=indent,eol,start


set fileformat=unix



" ThG: install plugins with vim-plug plugin manager (here Nvim-R and nerdtree)
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')                               
" Declare the list of plugins.                               
Plug 'jalvesaq/Nvim-R'  
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'gaalcaras/ncm-R'
Plug 'preservim/nerdtree'
Plug 'jalvesaq/vimcmdline'
Plug 'itchyny/calendar.vim'
Plug 'morhetz/gruvbox'
Plug 'norcalli/nvim-colorizer.lua'
" A fuzzy file finder
"Plug 'kien/ctrlp.vim'
" Comment/Uncomment tool
" Switch to the begining and the end of a block by pressing %
Plug 'tmhedberg/matchit'
" A Tree-like side bar for better navigation
Plug 'scrooloose/nerdtree'
" A cool status bar
Plug 'vim-airline/vim-airline'
" Airline themes
Plug 'vim-airline/vim-airline-themes'
" Nord
Plug 'arcticicestudio/nord-vim'
" Better syntax-highlighting for filetypes in vim
Plug 'sheerun/vim-polyglot'
" Git integration
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Auto pairing 
Plug 'jiangmiao/auto-pairs'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

colorscheme gruvbox
let g:airline_theme='gruvbox'

if (has("termguicolors"))
    set termguicolors
endif

lua require 'colorizer'.setup()

" Coc Autocompletion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>


