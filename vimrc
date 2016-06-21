""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/a.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/taglist.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-scripts/EasyGrep'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mileszs/ack.vim'
Plugin 'bronson/vim-visual-star-search'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" base config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on " 语法高亮
"set autochdir " 自动改变vim的当前目录为打开的文件所在目录"
set nocp " 关闭兼容模式
set fileencodings=utf-8,gbk
set foldmethod=indent
set foldlevelstart=99
set shiftwidth=4 " 缩进4个空格
set tabstop=4
set expandtab " Tab键展开为4个空格，插入Tab键<ctl-v>tab
set softtabstop=4 " 每次退格删除4个空格
set autoindent
set cindent
set hls
"set mouse=a " 激活鼠标
set number " 显示行号
set wildmode=longest,list " Ex命令自动补全采用bash方式
set incsearch " 在执行查找前预览第一处匹配

" 打开关闭quifkfix
function! ToggleQuickFix()
  if exists("g:qwindow")
    ccl
    unlet g:qwindow
  else
    try
      cw 10
      let g:qwindow = 1
    catch 
      echo "No Errors found!"
    endtry
  endif
endfunction
nmap <script> <C-q> :call ToggleQuickFix()<CR>

" 设置窗口预览参数，详见:help completeopt
"set completeopt=longest,menu,preview
set completeopt=longest,menu

" 设置预览窗口位置
augroup PreviewOnBottom
    autocmd InsertEnter * set splitbelow
    autocmd InsertLeave * set splitbelow!
augroup END

" 快捷键
" 键盘映射
" 调整窗口大小
" for example: vertival resize +10 
let mapleader = ","
map <C-v>s :vertical resize 
map <C-s> :resize
nmap <leader>nnu :set nonu<CR>
nmap <leader>nu :set nu<CR>
nmap <leader>w :cw<CR>
map <C-n> :NERDTreeTabsToggle<CR>
map <F3> :set paste<CR>
map <F4> :set nopaste<CR>
nnoremap <leader>q :cw<CR>


set background=dark
colorscheme solarized
" diff模式设置不同colors，防止对比色彩看不清
if &diff  
    colors torte
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" youcompleteme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = "$HOME/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项"
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_invoke_completion = '<C-/>'
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" <F5>清除缓存目录列表
"let g:ctrlp_root_markers = ['.'] " 设置根目录，如果为设置，默认为上层最近的.git .hg .svn .bzr所在的目录
"  c - the directory of the current file.
"  a - like "c", but only applies when the current working directory outside of
"      CtrlP isn't a direct ancestor of the directory of the current file.
"  r - the nearest ancestor that contains one of these directories or files:
"      .git .hg .svn .bzr _darcs
"  w - begin finding a root from the current working directory outside of CtrlP
"      instead of from the directory of the current file (default). Only applies
"      when "r" is also present.
let g:ctrlp_working_path_mode = "ra"
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:40'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|d|tar|gz)$',
  \ }
"let g:ctrlp_user_command = 'find %s -type f' "添加这样代码后g:ctrlp_custom_ignore不生效

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.o$', '\~$', '\.d$', '\.tar$', '\.gz$', '^core\.', '\.pyc$'] "过滤文件

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Sort_Type="name" " 按名字排序 order: 按tag出现顺序排序
let Tlist_Auto_Highlight_Tag=1
nmap <C-t> :TlistToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyGrep
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *EasyGrepMode*  [default=0]
" Specifies the mode in which to start.
" 0 - All files
" 1 - Open Buffers
" 2 - Track the current extension
" 3 - User mode -- Use a custom, on demand set of extensions
let EasyGrepMode=0
let EasyGrepDefaultUserPattern="*.h *.cc *.cpp *.c *.hpp *.hxx"
let EasyGrepCommand=1
let EasyGrepJumpToMatch=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bufexplorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='name'        " Sort by name.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitBelow=1        " Split new window below current.
let g:bufExplorerHorzSize=20          " New split window is n rows high.
autocmd BufWinEnter \[Buf\ List\] setl nonumber


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ack_default_options=" -s -H --nocolor --nogroup --column --cpp --cc"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-instant-markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 依赖node.js
" sudo add-apt-repository ppa:chris-lea/node.js
" sudo apt-get update
" sudo apt-get install nodejs
" sudo npm -g install instant-markdown-d
let g:instant_markdown_autostart = 0
map <C-m> :InstantMarkdownPreview<CR>
"let g:instant_markdown_slow = 1
