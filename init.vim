call plug#begin('~/.vim/plugged')

"" leave some space in between
 " Plug 'preservim/nerdtree'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

 " Sintax
 Plug 'sheerun/vim-polyglot'

 " status bar
 Plug 'maximbaz/lightline-ale'
 Plug 'itchyny/lightline.vim'

 " Theme
 Plug 'morhetz/gruvbox'
 Plug 'shinchu/lightline-gruvbox.vim'
 Plug 'audibleblink/hackthebox.vim'

 " Tree
 Plug 'scrooloose/nerdtree'

 " typing
 Plug 'jiangmiao/auto-pairs'
 Plug 'alvan/vim-closetag'
 Plug 'tpope/vim-surround'

 " tmux
 Plug 'benmills/vimux'
 Plug 'christoomey/vim-tmux-navigator'

 " IDE
 Plug 'editorconfig/editorconfig-vim'
 Plug 'junegunn/fzf'
 Plug 'junegunn/fzf.vim'
 Plug 'terryma/vim-multiple-cursors' " Multiple cursors selected
 Plug 'mhinz/vim-signify'
 Plug 'yggdroot/indentline'
 Plug 'scrooloose/nerdcommenter' 

 " Eslint
 Plug 'w0rp/ale'
 " Plug 'roxma/nvim-completion-manager'
 Plug 'ncm2/ncm2'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 
 " icons
 Plug 'ryanoasis/vim-devicons'

 " Golang
 
 Plug 'fatih/vim-go', { 'for': 'go'  }

 " Nerd Tree Sintax Highlight
 
 Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

 " Nvim Finder

 Plug 'RishabhRD/popfix'
 Plug 'RishabhRD/nvim-finder'

 " Git lens

 Plug 'APZelos/blamer.nvim'

 call plug#end()


set number
set mouse=a
set clipboard=unnamed
syntax on
set showcmd
set ruler
set cursorline
set encoding=utf8
set showmatch
"set relativenumber

"" Searching
set hlsearch " higlight matches
set incsearch " incremental Searching
set ignorecase " searches are case at latest one capital letter
set smartcase " ... unless they contain at latest one capital letter

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinPos = "right"
let NERDTreeMapOpenInTab='<TAB>'

" Golang Settings

let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"


" Git lens settings
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = 'Commit --> '
let g:blamer_template = '<committer> <summary>'
let g:blamer_date_format = '%d/%m/%y'
let g:blamer_relative_time = 1
highlight Blamer guifg=lightgrey





  let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
\ }

let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
syntax on


" Color Schema
"colorscheme gruvbox
"let g:gruvbox_contrast_dark="dark"
"highlight Normal ctermbg=NONE
"set laststatus=2
"set noshowmode
let NERDTreeShowHidden=1
set background=dark
highlight clear

if exists("sintax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name="hackthebox"

if !exists("g:hackthebox_termcolors")
  let g:hackthebox_termcolors = 256
endif

let g:hackthebox_terminal_italics = 1
if !exists("g:hackthebox_terminal_italics")
  let g:hackthebox_terminal_italics = 0
endif

function! s:h(group, style)
  if g:hackthebox_terminal_italics ==0 && has_key(a:style, "cterm") && a:style["cterm"] == "italic"
    unlet a:style.cterm
  endif
  if g:hackthebox_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
endfunction

colorscheme hackthebox

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr >
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
nmap <Space>l  <Plug>(coc-format-selected)

" map key
nnoremap <F3> :NERDTreeToggle<CR>

" split resize
nnoremap <Space>> 10<C-w>>
nnoremap <Space>< 10<C-w><

" quick semi
nnoremap <Space>; $a;<Esc>

nnoremap <Space>w :w<CR>
nnoremap <Space>q :q<CR>
nnoremap <Space>Q :q!<CR>

" search
map <Space>nt :NERDTreeFind<CR>
map <Space>f :Files<CR>
map <Space>hf :Ag<CR>

" Search words

map <Space>s :Rg<CR>

" tmux navigator
nnoremap <silent> <Space><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <Space><C-k> :TmuxNavigateRight><cr>
nnoremap <silent> <Space><C-u> :TmuxNavigateUp><cr>
nnoremap <silent> <Space><C-j> :TmuxNavigateDown><cr>

" Tabs navigator
map <Space>tp :tabprevious<cr>
map <Space>tn :tabnext<cr>
map <Space>t :tabnew<cr>

" fast scrolling
nnoremap <C-Down> 10<C-e>
nnoremap <C-Up> 10<C-y>

nnoremap <C-LeftMouse> <LeftMouse>:GoImplements<CR>

" Tabs finder

map <Space>T :W<CR>

"******************
"custom shortcuts
"******************

" horizontal split
map <Space>H :sp<cr>
" vertical split
map <Space>V :vsplit<cr>

"open terminal
set splitbelow
function! OpenTerminal()
   " move to right most buffer
   execute "normal \<C-l>"
   execute "normal \<C-l>"
   execute "normal \<C-l>"
   execute "normal \<C-l>"

   let bufNum = bufnr("%")
   let bufType = getbufvar(bufNum, "&buftype", "not found")

   if bufType == "terminal"
     " close existing terminal
     execute "q"
   else
     " open terminal
     execute "vsp term://zsh"
     "turn off numbers
     execute "set nonu"
     execute "set nornu"

     " toggle insert on enter/exit
     silent au BufLeave <buffer> stopinsert!
     silent au BufWinEnter, WinEnter <buffer> startinsert!
 
     " set maps inside terminal buffer
     execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
     execute "tnoremap <buffer> <C-X> <C-\\><C-n>:q<CR>"
     execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

     startinsert!
   endif
endfunction
nnoremap <C-X> :call OpenTerminal()<CR>

" Function to terminal in bottom
function! OpenTerminalGit()
   " move to right most buffer
   execute "sp"
   execute "call OpenTerminal()"
   execute "normal \<C-l>"
   execute "q"
endfunction

map <Space>th :call OpenTerminalGit()<CR>



 let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-prettier'
  \ ]

  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif 

  "colorscheme spaceduck

  " Eslint
  let g:ale_fixers = {
    \   'javascript': ['prettier', 'eslint']
    \}

  let g:ale_linters = {}
  let g:ale_linters.typescript = ['eslint', 'tsserver']
  let g:ale_typescript_prettier_use_local_config = 1
  let g:ale_fix_on_save = 1
  let g:ale_linters_explicit = 1

  " Autocompletion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
