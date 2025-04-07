" https://stackoverflow.com/questions/20579142/toggle-function-in-vim
let s:enabled = 0
function! ToggleWhiteSpace(mycmd)
    if s:enabled
        set nolist
        let s:enabled = 0
    else
        set list
        let s:enabled = 1
    endif
endfunction

command! -nargs=0 ToggleWhiteSpace call ToggleWhiteSpace("list")
