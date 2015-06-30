syntax on " 语法高亮
set autochdir " 自动改变vim的当前目录为打开的文件所在目录
set tags=tags;
set tags+=~/.vim/tags/tags
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
set cursorline " 光标所在行加下划线 
set hls
"set mouse=a " 激活鼠标
set number " 显示行号
set wildmode=longest,list " Ex命令自动补全采用bash方式
set incsearch " 在执行查找前预览第一处匹配
" 取消高亮
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" omnicppcomplete{
filetype plugin indent on
set completeopt=longest,menu
let OmniCpp_NamespaceSearch = 2 " search namespaces in the current buffer and in included files
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" }

"colorscheme torte

" 键盘映射
" 1. 调整窗口大小
" for example: vertival resize +10 
map <C-v>s :vertical resize 
map <C-s> :resize
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

" 2.
map <C-n> :NERDTree<CR>
let NERDTreeIgnore=['\.o$', '\~$', '\.d$', '\.tar$', '\.gz$', '^core\.'] "过滤文件

" 退出后保留状态文件
"au VimLeave * mksession! .session
"au VimLeave * wviminfo! .viminfo

" pathogen{
execute pathogen#infect()
"execute pathogen#runtime_append_all_bundles()
"}

" taglist{
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Sort_Type="name" " 按名字排序 order: 按tag出现顺序排序
"}

" bufexplorer{
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='name'        " Sort by name.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitBelow=1        " Split new window below current.
let g:bufExplorerHorzSize=20          " New split window is n rows high.
autocmd BufWinEnter \[Buf\ List\] setl nonumber
"}

" winmanager{
" :WMToggle
let g:AutoOpenWinManager = 0
""let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer' " by default
"let g:winManagerWindowLayout = 'FileExplorer|BufExplorer'
""let g:winManagerWindowLayout = "BufExplorer,TagsExplorer"
"let g:winManagerWidth = 30
"let g:defaultExplorer = 0
"}

" minibufexplorer{
" :buffer
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1 
"}

" cscope{
"if has("cscope")
"    set csprg=/usr/local/bin/cscope
"    set csto=1
"    set cst
"    set nocsverb
"    " add any database in current directory
"    if filereadable("cscope.out")
"    cs add cscope.out
"    endif
"    set csverb
"endif

"s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
"g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
"d: 查找本函数调用的函数
"c: 查找调用本函数的函数
"t: 查找指定的字符串
"e: 查找egrep模式，相当于egrep功能，但查找速度快多了
"f: 查找并打开文件，类似vim的find功能
"i: 查找包含本文件的文件
nmap <C-s> :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"}

" latex-suite{
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex' 
" }

" 设置预览窗口位置
augroup PreviewOnBottom
    autocmd InsertEnter * set splitbelow
    autocmd InsertLeave * set splitbelow!
augroup END

"Paste toggle - when pasting something in, don't indent.
map <F3> :set paste<CR>
map <F4> :set nopaste<CR>
let mapleader = ","

" EasyGrep
let EasyGrepMode=2 "Track the current extension , see :help easygrep for more info

" CtrlP
" <F5>清楚缓存目录列表
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
" 以下设置未生效，原因暂时未知
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|svn'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
"let g:ctrlp_user_command = 'find %s -type f'

" vim-airline
"let g:airline#extensions#tabline#enabled = 1
