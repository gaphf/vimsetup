" ==================================
" ===         General            ===
" ==================================

"set guifont=Menlo\ Regular:h15		" set font to Menlo size 15
set noshowmode				        " Hide status
set number				            " show line numbers
set splitbelow                      " open split plane below the editor
set splitright                      " open split plane right to the editor
set mouse=a                         " mouse setting on
set clipboard=autoselect            " vim clipboard to os clipboard
set laststatus=2                    " always show statusbar.	
set tabstop=2                       " set tab width to 2 columns.
syntax enable                       " Syntax enable  
set nocompatible                    " Disable Vi defaults.
set autoindent                      " Autoindent when starting new line, or using `o` or `O`.
"set backspace=indent,eol,start		" Allow backspace in insert mode.
set ruler                           " Show the line and column number of the cursor position.
set incsearch                       " Enable highlighted case-insensitive incremential search.
set ignorecase                      " Ignore capital letters during search.
set hlsearch                        " Enable search highlighting.
set wildmenu                        " Autocomplete commands using nice menu in place of window status. Enable `Ctrl-N` and `Ctrl-P` to scroll through matches.
set wildmode=longest,full           " For autocompletion, complete as much as you can.
set noerrorbells                    " Disable any annoying beeps on errors.
set visualbell                      " Disable any annoying beeps on errors.
set termguicolors                   " Improve displayed color
set title                           " Set window title by default.

" ==================================
" ===       Colorscheme          ===
" ==================================

 let g:sonokai_style = 'shusia'
 let g:sonokai_better_performance = 1
 colorscheme sonokai

" ==================================
" ===        Statusline          ===
" ==================================

" Define color variables
let g:StslineColorGreen  = "#2BBB4F"
let g:StslineColorBlue   = "#4799EB"
let g:StslineColorViolet = "#986FEC"
let g:StslineColorYellow = "#D7A542"
let g:StslineColorOrange = "#EB754D"
let g:StslineColorLight  = "#C0C0C0"
let g:StslineColorDark   = "#080808"
let g:StslineColorDark1  = "#181818"
let g:StslineColorDark2  = "#202020"
let g:StslineColorDark3  = "#303030"

" Define colors
let g:StslineBackColor   = g:StslineColorDark2
let g:StslineOnBackColor = g:StslineColorLight
"let g:StslinePriColor   = g:StslineColorGreen
let g:StslineOnPriColor  = g:StslineColorDark
let g:StslineSecColor    = g:StslineColorDark3
let g:StslineOnSecColor  = g:StslineColorLight

" Create highlight groups
execute 'highlight StslineSecColorFG guifg=' . g:StslineSecColor   ' guibg=' . g:StslineBackColor
execute 'highlight StslineSecColorBG guifg=' . g:StslineColorLight ' guibg=' . g:StslineSecColor
execute 'highlight StslineBackColorBG guifg=' . g:StslineColorLight ' guibg=' . g:StslineBackColor
execute 'highlight StslineBackColorFGSecColorBG guifg=' . g:StslineBackColor ' guibg=' . g:StslineSecColor
execute 'highlight StslineSecColorFGBackColorBG guifg=' . g:StslineSecColor ' guibg=' . g:StslineBackColor
execute 'highlight StslineModColorFG guifg=' . g:StslineColorYellow ' guibg=' . g:StslineBackColor

" Create statusline
setlocal statusline=%#StslinePriColorBG#\ %{StslineMode()}%#StslineSecColorBG#\ \%{&readonly?\"\ \":\"\"}%F\ %#StslineModColorFG#%{&modified?\"\ \":\"\"}%=%#StslinePriColorFG#\ %{&filetype}\ %#StslineSecColorFG#%#StslineSecColorBG#%{&fenc!='utf-8'?\"\ \":''}%{&fenc!='utf-8'?&fenc:''}%{&fenc!='utf-8'?\"\ \":''}%#StslinePriColorFGSecColorBG#%#StslinePriColorBG#\ %p\%%\ %#StslinePriColorBGBold#%l%#StslinePriColorBG#/%L\ :%c\ 

" Get statusline mode and also set primary color for that mode
function! StslineMode()

    let l:CurrentMode=mode()

    if l:CurrentMode==#"n"
        let g:StslinePriColor     = g:StslineColorGreen
        let b:CurrentMode = "NORMAL "

    elseif l:CurrentMode==#"i"
        let g:StslinePriColor     = g:StslineColorViolet
        let b:CurrentMode = "INSERT "

    elseif l:CurrentMode==#"c"
        let g:StslinePriColor     = g:StslineColorYellow

        let b:CurrentMode = "COMMAND "

    elseif l:CurrentMode==#"v"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "VISUAL "

    elseif l:CurrentMode==#"V"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "V-LINE "

    elseif l:CurrentMode==#"\<C-v>"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "V-BLOCK "

    elseif l:CurrentMode==#"R"
        let g:StslinePriColor     = g:StslineColorViolet
        let b:CurrentMode = "REPLACE "

    elseif l:CurrentMode==#"s"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "SELECT "

    elseif l:CurrentMode==#"t"
        let g:StslinePriColor     =g:StslineColorYellow
        let b:CurrentMode = "TERM "

    elseif l:CurrentMode==#"!"
        let g:StslinePriColor     = g:StslineColorYellow
        let b:CurrentMode = "SHELL "

    endif

    call UpdateStslineColors()

    return b:CurrentMode

endfunction

" Update colors. Recreate highlight groups with new Primary color value.
function! UpdateStslineColors()

execute 'highlight StslinePriColorBG           guifg=' . g:StslineOnPriColor ' guibg=' . g:StslinePriColor
execute 'highlight StslinePriColorBGBold       guifg=' . g:StslineOnPriColor ' guibg=' . g:StslinePriColor ' gui=bold'
execute 'highlight StslinePriColorFG           guifg=' . g:StslinePriColor   ' guibg=' . g:StslineBackColor
execute 'highlight StslinePriColorFGSecColorBG guifg=' . g:StslinePriColor   ' guibg=' . g:StslineSecColor
execute 'highlight StslineSecColorFGPriColorBG guifg=' . g:StslineSecColor   ' guibg=' . g:StslinePriColor

endfunction
