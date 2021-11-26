
"#################################
"-- Plugin List

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
call plug#end()


"#########################
"-- Others

syn on
set nu
set incsearch
set hlsearch
set nocompatible 
set backspace=indent,eol,start


set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

set showcmd

"magic match it with key %
runtime macros/matchit.vim

" Face
colorscheme PaperColor
set background=dark

"Open the expert indent 
filetype plugin indent on 

"Ctags
if $WA != ""
	set tags+=$BR/$BUILD/tags
  "For the HBM3 
	set tags+=$WA/tags
endif 
set tags+=~/TAGS/vip_tags 
set tags+=~/TAGS/uvm_tags

"enable the rainbow parentheses
"let g:ranbow_active = 1

"############################
"-- ShotCut 

"keys binding 
nnoremap <leader>tp :RainbowParenthesesToggleAll<CR>
nnoremap <leader>cpf :let @+ = expand("%:p")<CR>
nnoremap <leader>b   :ls<CR>:b 
if $WA != ""
    "map the F2 to search for the reg description in the l4csr_ALL_4mas.txt
    "map the F3 to search for the reg description in the csr.txt
    "TODO how to keep searching for the keyword from the first line?
    noremap <F2> y:vsplit +/<C-R>"\\c $BR/rtl/src/l4csr_ALL_4mas.txt<CR>
    noremap <F3> y:vsplit +/<C-R>"\\c $WA/rtl/pub/csr.txt<CR>
endif 

nnoremap <C-]> :ts <C-R><C-W><CR>

"command map
"serach ERROR: abbreviation
cab /e /UVM_ERROR:/
cab ?e /UVM_ERROR:/?
"FIXME
"cab /ue /UVM_ERROR/
"cab ?ue /UVM_ERROR/?

"insert map. Use the C-V to aviod the abbreviate to be expanded (Depracated)
"iab //* //***************************************************************************
"iab uinfo `uvm_info(msg, $sformatf(), UVM_LOW)<del><Esc>F(a
"iab uerr `uvm_error(msg, $sformatf())<del><Esc>F(a
""iab ufatal `uvm_fatal(msg $sformatf())<del><Esc>F(a
"iab idate //edited by Gavin Huang(taohua@synopsys.com) @ <C-R>=strftime("%c")<CR>

"*********************************************************************************************************
"                       auto header (deprecated, We will use the snippet for that) 
"*********************************************************************************************************
"autocmd bufnewfile *.* call InsertHeader()
"
"function InsertHeader()
"  let current_filetype             = &filetype
"  let current_filename             = expand("%:t")
"  let current_filename_without_ext = expand("%:t:r")
"  let current_fileext              = expand("%:e")
"  "SV files
"  if current_filetype == "verilog_systemverilog"
"    0r /u/taohua/.vim/header/sv_header.txt
"    call cursor(17,1)
"    let line = line(".")
"    call append(line, "* File Name     :  ".current_filename    )
"    call append(line+1, "* Description   :  "                     )
"    call append(line+2, "* Create Date   :  ".strftime("%b %d %Y"))
"    call append(line+3, "* Last Modified :  "                     )
"    call append(line+4, "* Create By     :  ".$USER."@synopsys.com")
"    call setline(line+8, "`ifndef ".toupper(current_filename_without_ext)."__".toupper(current_fileext))
"    call setline(line+9, "`define ".toupper(current_filename_without_ext)."__".toupper(current_fileext))
"    call setline(line+10, " ")
"    call setline(line+11, "`endif //".toupper(current_filename_without_ext)."__".toupper(current_fileext))
"    call cursor(line+10,1)
"  elseif current_filetype == "python"
"    0r /u/taohua/.vim/header/py_header.txt
"    call cursor(2,1)
"  elseif current_filetype == "perl"
"    0r /u/taohua/.vim/header/pl_header.txt
"    call cursor(2,1)
"  endif
"
"endfunction

"UltiSnips configuration 
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit="~/.vim/mysnippets/"
let g:UltiSnipsSnippetDirectories=["UltliSnips", "mysnippets"]
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

