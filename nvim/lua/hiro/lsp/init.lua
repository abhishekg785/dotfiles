local lsp = require'lspconfig'
local completion = require'completion'

local telescope_mapper = require('hiro.telescope.mappings')

local map = function(type, key, value)
    vim.fn.nvim_buf_set_keymap(0, type, key, value, {noremap=true, silent=true});
end

-- configuring LSP servers
local custom_attach  = function(client)
    print("LSP started.")

    completion.on_attach(client);

    -- Goto mappings
    map('n', '<leader>va', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    map('n', '<leader>vd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    map('n', '<leader>vi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    map('n', '<leader>vsh', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    map('n', '<leader>vrr', '<cmd>lua vim.lsp.buf.references()<CR>')
    map('n', '<leader>vtd', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

    telescope_mapper('<leader>vrr', 'lsp_references', {
        sorting_strategy = "ascending",
        prompt_position = "top",
        ignore_filename = true,
    }, true)

    -- Action mappings
    map('n', '<leader>vrn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n', '<leader>vh', '<cmd>lua vim.lsp.buf.hover()<CR>')
    map('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    map('n', '<leader>vsd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')

    -- Few language server support these atm
    map('n', '<leader>vbf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    map('n', '<leader>ai', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
    map('n', '<leader>ao', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

lsp.tsserver.setup{ on_attach=custom_attach  }
lsp.gopls.setup{ on_attach=custom_attach  }
lsp.rls.setup{ on_attach=custom_attach  }
lsp.clangd.setup{ on_attach=custom_attach  }
lsp.intelephense.setup{ on_attach=custom_attach  }
lsp.pyls.setup{ on_attach=custom_attach  }
lsp.cssls.setup{ on_attach=custom_attach }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lsp.html.setup{
    capabilities=capabilities,
    on_attach=custom_attach
}

local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
    system_name = "Windows"
else
    print("Unsupported system for lua sumneko")
end
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
require'lspconfig'.sumneko_lua.setup {
    cmd={
        sumneko_binary, "-E",
        sumneko_root_path .. "/main.lua"
    };
    on_attach=custom_attach;
    settings={
        Lua = {
            diagnostics={
                enable = true,
                globals = {'vim'},
            },
        },
    };
}

-- handle code references using telescope
-- vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references
