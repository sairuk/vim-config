" https://stackoverflow.com/questions/20579142/toggle-function-in-vim
let s:enabled = 0
function! ToggleMouseMode()
    if s:enabled
        set mouse=a
        let s:enabled = 0
    else
        set mouse=r
        let s:enabled = 1
    endif
endfunction

command! -nargs=0 ToggleMouseMode call ToggleMouseMode()
