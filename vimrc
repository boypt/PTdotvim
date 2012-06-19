call pathogen#infect()
call pathogen#helptags()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=300

" Enable filetype plugin
filetype on
filetype indent on
filetype plugin on
syntax on

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    "colorscheme desert256
    colorscheme desert
    set guifont=Inconsolata\ 12
    " If the current buffer has never been saved, it will have no name,
    " call the file browser to save it, otherwise just save it.
    :map <silent> <C-S> :if expand("%") == ""<CR>:browse confirm w<CR>:else<CR>:confirm w<CR>:endif<CR>
    :imap <c-s> <Esc><c-s>
    :imap <c-s> <c-o><c-s>
else
    colorscheme desert
endif

set hlsearch
set incsearch
set mouse=a
set showmatch

set cmdheight=2 "The commandbar height
set hid "Change buffer - without saving


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set autoindent
set smartindent
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nav in windows
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

let g:Tb_MaxSize = 3 

nmap <silent> <C-Tab> :tabnext<CR>
nmap <silent> <C-S-Tab> :tabprev<CR>

map <silent> <A-,> :bprevious<CR>
map <silent> <A-.> :bnext<CR>

nmap <silent> <Leader>P <Plug>ToggleProject

nmap <silent> <F2> :NERDTreeToggle<CR>
"nmap <silent> <F3> <Plug>ToggleProject
map <silent> <F4> :BufExplorerToggle<CR>

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99

au FileType python iabbr pdb import pdb;pdb.set_trace()
au FileType python iabbr ipdb import ipdb;ipdb.set_trace()

let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'

" python module complete: ^X ^O
au FileType python set omnifunc=pythoncomplete#Complete

"let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview


function! ToggleComment () 
    let currline = getline(".")
    if currline =~ '^#'
        s/^#//
    else 
        s/^/#/
    endif
endfunction

map <silent> # :call ToggleComment()<CR>j0

"""""""""""""""""""""
"Tlist
"""""""""""""""""""""

nmap <F9> :silent! TlistToggle<CR>
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 "不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0

:command! Thtml :%!tidy -q -i -html

" map <F3> and <S-F3> to jump between locations in a quickfix list, or
" " differences if in window in diff mode
nnoremap <expr> <silent> <F3>   (&diff ? "]c" : ":cnext\<CR>")
nnoremap <expr> <silent> <S-F3> (&diff ? "[c" : ":cprev\<CR>")

