" vim: foldmethod=marker

" plugin specific set{{{

" vim better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" quick scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" enable auto format when write
let g:goimports = 1

" ultisnips snippets support
let g:completion_enable_snippet = "UltiSnips"

" }}}

" plugin specific map {{{

" undotree
nnoremap <leader>u :UndotreeShow<CR>

" }}}

" gutentags {{{
let g:gutentags_ctags_executable = "/usr/local/bin/ctags"
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

let g:gutentags_ctags_exclude = ['*.css', '*.html', 'node_modules']
let g:gutentags_ctags_extra_args = ['--fields=+ainKz']
" }}}

" telescope finder {{{
lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>ph :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
" }}}
