" source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/markdown_snippets.vim
source $HOME/.config/nvim/keys/mappings.vim
set number
set relativenumber
set cursorline
syntax on
set smartcase
call plug#begin('~/.config/nvim/autoload/plugged') 
Plug 'ajmwagar/vim-deus'
Plug 'Yggdroot/indentLine'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Fast python completion (use ncm2 if you want type info or snippet support)
Plug 'HansPinckaers/ncm2-jedi'
" Words in buffer completion
Plug 'ncm2/ncm2-bufword'
" Filepath completion
Plug 'ncm2/ncm2-path'
" plugins from chris@machine
" Better Syntax Support
Plug 'sheerun/vim-polyglot'
" File Explorer
Plug 'scrooloose/NERDTree'
" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
" themes
" Plug 'joshdick/onedark.vim'
" auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" commentary
Plug 'tpope/vim-commentary'
" ranger
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
" git plugins
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
" tmux navigator
Plug 'christoomey/vim-tmux-navigator'
" emmet
Plug 'mattn/emmet-vim'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()
let g:python_highlight_all = 1
" +================================ 可视化缩进 =====================================+ "
let g:indent_guides_enable_on_vim_startup = 0  " 默认关闭
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/themes/airline.vim
"source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/signify.vim
" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'

" settings for commentary
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>
colorscheme deus
" set python3 path
let g:python3_host_prog = '/usr/local/bin/python3'
" emmet setting
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Compile function
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc
