" ================================================
" ===                Statusline                ===
" ==  Thanks to: https://pastebin.com/qWRQVzES  ==
" ================================================

" Set colors and set statusbar on.
set termguicolors
set laststatus=2
set noshowmode

" Define color variables
let g:StslineColorGreen  = "#2BBB4F"
let g:StslineColorBlue   = "#4799EB"
let g:StslineColorViolet = "#986FEC"
let g:StslineColorYellow = "#D7A542"
let g:StslineColorOrange = "#EB754D"
let g:StslineColorLight  = "#ffffff"
let g:StslineColorDark   = "#080808"
let g:StslineColorDark1  = "#181818"
let g:StslineColorDark2  = "#202020"
let g:StslineColorDark3  = "#303030"

" Define colors
let g:StslineBackColor   = g:StslineColorDark2
let g:StslineOnBackColor = g:StslineColorLight
let g:StslinePriColor    = g:StslineColorGreen
let g:StslineOnPriColor  = g:StslineColorDark
let g:StslineSecColor    = g:StslineColorDark3
let g:StslineOnSecColor  = g:StslineColorLight

" Create highlight groups
execute ' highlight StslineSecColorFG                guifg= ' g:StslineSecColor    ' guibg=' g:StslineBackColor
execute ' highlight StslineSecColorBG                guifg= ' g:StslineColorLight  ' guibg=' g:StslineSecColor
execute ' highlight StslineBackColorBG               guifg= ' g:StslineColorLight  ' guibg=' g:StslineBackColor
execute ' highlight StslineBackColorFGSecColorBG     guifg= ' g:StslineBackColor   ' guibg=' g:StslineSecColor
execute ' highlight StslineSecColorFGBackColorBG     guifg= ' g:StslineSecColor    ' guibg=' g:StslineBackColor
execute ' highlight StslineModColorFG                guifg= ' g:StslineColorYellow ' guibg=' g:StslineBackColor

" Update colors. Recreate highlight groups with new Primary color value.
function! UpdateStslineColors()

execute ' highlight StslinePriColorBG                guifg= ' g:StslineOnPriColor  ' guibg= ' g:StslinePriColor
execute ' highlight StslinePriColorBGBold            guifg= ' g:StslineOnPriColor  ' guibg= ' g:StslinePriColor  ' gui=bold '
execute ' highlight StslinePriColorFG                guifg= ' g:StslinePriColor    ' guibg= ' g:StslineBackColor
execute ' highlight StslinePriColorFGSecColorBG      guifg= ' g:StslinePriColor    ' guibg= ' g:StslineSecColor
execute ' highlight StslineSecColorFGPriColorBG      guifg= ' g:StslineSecColor    ' guibg= ' g:StslinePriColor
 
endfunction

" Create statusline
set statusline=%#StslinePriColorFGSecColorBG#%#StslinePriColorBG#\ %{StslineMode()}
set statusline+=%#StslineSecColorBG#\ \%r
set statusline+=%#StslineSecColorBG#\ %F\ 
set statusline+=%#StslineSecColorBG#\ \%m
set statusline+=%=
set statusline+=%#StslineSecColorBG#\ \%y\ 
set statusline+=%#StslinePriColorFGSecColorBG#%#StslinePriColorBG#\ %p\%%\ 
set statusline+=%#StslinePriColorBGBold#%l
set statusline+=%#StslinePriColorBG#/%L\ :
set statusline+=%c

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


