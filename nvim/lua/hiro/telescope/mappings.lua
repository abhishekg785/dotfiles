local map_tele = function(key, f, options, buffer)
  local mode = "n"
  local rhs = string.format(
    "<cmd>lua R('hiro.telescope')['%s'](%s)<CR>",
    f,
    options and vim.inspect(options, { newline = '' }) or ''
  )

  local opts = {
      noremap = true,
      silent = true,
  }

  if not buffer then
    vim.api.nvim_set_keymap(mode, key, rhs, opts)
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, opts)
  end
end

vim.api.nvim_set_keymap('c', '<c-r><c-r>', '<Plug>(TelescopeFuzzyCommandSearch)', { noremap = false, nowait = true })

map_tele('<leader>en', 'edit_neovim')

map_tele('<leader>fb', 'buffers')
map_tele('<leader>fp', 'my_plugins')
map_tele('<leader>fi', 'search_all_files')
map_tele('<leader>cf', 'curbuf')
map_tele('<leader>fh', 'help_tags')
map_tele('<leader>so', 'vim_options')
map_tele('<leader>gp', 'grep_prompt')

map_tele('<C-p>'     , 'git_files')
map_tele('<leader>ft', 'git_files_dropdown')
map_tele('<leader>fg', 'live_grep')
map_tele('<leader>fo', 'oldfiles')
map_tele('<leader>fd', 'fd')
map_tele('<leader>ps', 'project_search')
map_tele('<leader>pw', 'grep_string', {
  short_path = true,
  word_match = '-w',
  only_sort_text = true
})


-- Telescope Meta
map_tele('<leader>fB', 'builtin')

return map_tele
