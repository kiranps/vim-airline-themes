" Nairobi Airline - A Material Color Scheme
"
" Author:       Kiran PS <pskirann@gmail.com>
" Repository:   https://github.com/kiranps/nairobi
" Version:      2.0
" License:      MIT

let s:theme = 'nairobi'

" To highlight when the buffer is modified:
"     let g:airline_nairobi_showmod = 1
let s:want_showmod = get(g:, 'airline_nairobi_showmod', 0)

function! airline#themes#{s:theme}#refresh()
    " Normal
    let N1 = [ '#262626', '#808080', 235, 244 ]
    let N2 = [ '#8A8A8A', '#444444', 245, 238 ]
    let N3 = [ '#BCBCBC', '#303030', 255, 236 ]

    " Inactive
    let IA = [ '#666666', N3[1], 242, N3[3] ]

    " Error
    let ER = [ '#1C1C1C', '#D75F5F', 234, 167 ]

    " Warning
    let WI = [ ER[0], '#FFAF5F', ER[2], 215 ]

    " Terminal
    let TE = [ ER[0], N1[1], N1[2], N1[3] ]

    " Reverse
    let NR = [ N2[1], N2[0], N2[3], N2[2], 'bold' ]


    let palette = {}

    let palette.normal = airline#themes#generate_color_map(N1, N2, N3)
    let palette.normal.airline_error   = ER
    let palette.normal.airline_warning = WI
    let palette.normal.airline_term    = TE

    let palette.insert   = palette.normal
    let palette.replace  = palette.normal
    let palette.visual   = palette.normal
    let palette.inactive = airline#themes#generate_color_map(IA, IA, IA)

    if s:want_showmod
        let palette.normal_modified = { 'airline_a': NR, 'airline_z': NR }
    endif

    " Accents
    let palette.accents = {
                \ 'red': [ ER[1], '', ER[3], '' ]
                \ }

    " CtrlP
    if get(g:, 'loaded_ctrlp', 0)
        let palette.ctrlp = airline#extensions#ctrlp#generate_color_map(N3, N2, NR)
    endif

    let g:airline#themes#{s:theme}#palette = palette
endfunction

call airline#themes#{s:theme}#refresh()
