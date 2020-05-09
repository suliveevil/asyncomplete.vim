if exists('g:asyncomplete_loaded')
    finish
endif
let g:asyncomplete_loaded = 1

let s:is_nvim = has('nvim')
let s:has_lua = has('lua') || has('nvim-0.2.2')

if s:has_lua
    if !s:is_nvim
        " make vim behave like neovim
        let s:plugin_dir = fnamemodify(expand('<sfile>:p:h') . '/../', ':p:h:gs?\\?/?')
        lua package.path = vim.eval("s:plugin_dir") .. '/lua/?.lua;' .. vim.eval("s:plugin_dir") .. '/lua/?/init.lua;' .. package.path
    endif
    lua asyncomplete = require('asyncomplete')
    lua asyncomplete.init()
else
    " TODO: fallback to v2 so it works when lua is not available
endif

" if get(g:, 'asyncomplete_enable_for_all', 1)
"     augroup asyncomplete_enable
"         au!
"         au BufEnter * if exists('b:asyncomplete_enable') == 0 | call asyncomplete#enable_for_buffer() | endif
"     augroup END
" endif

" let g:asyncomplete_manager = get(g:, 'asyncomplete_manager', 'asyncomplete#managers#vim#init')
" let g:asyncomplete_change_manager = get(g:, 'asyncomplete_change_manager', ['asyncomplete#utils#_on_change#textchangedp#init', 'asyncomplete#utils#_on_change#timer#init'])
" let g:asyncomplete_triggers = get(g:, 'asyncomplete_triggers', {'*': ['.', '>', ':'] })

" let g:asyncomplete_auto_completeopt = get(g:, 'asyncomplete_auto_completeopt', 1)
" let g:asyncomplete_auto_popup = get(g:, 'asyncomplete_auto_popup', 1)
" let g:asyncomplete_popup_delay = get(g:, 'asyncomplete_popup_delay', 30)
" let g:asyncomplete_log_file = get(g:, 'asyncomplete_log_file', '')
" let g:asyncomplete_preprocessor = get(g:, 'asyncomplete_preprocessor', [])

" inoremap <silent> <expr> <Plug>(asyncomplete_force_refresh) asyncomplete#force_refresh()
