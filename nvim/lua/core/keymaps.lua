local handle = require('core.handle')
local dap = require('dap')
local dapui = require('dapui')

local M = {
  n = {
    ['+'] = { '<C-a>', 'Increment' },
    ['-'] = { '<C-x>', 'Decrement' },
    ['x'] = { '"_x', 'Do not yank with "x"' },
    ['<Esc>'] = { '<cmd>noh<cr><Esc>', 'Hide search highlighting' },
    ['<C-a>'] = { 'ggVG', 'Select All' },
    ['<C-s>'] = { '<cmd>w<cr>', 'Save changes' },
    ['<A-up>'] = { '<cmd>m .-2<cr>==', 'Move line Up' },
    ['<A-down>'] = { '<cmd>m .+1<cr>==', 'Move line Down' },
    ['<Leader>ri'] = { 'gg=G', 'Reindent' },
    ['<Leader>tc'] = { '<cmd>tabedit<cr>', 'Create Tab' },
    ['<Tab>'] = { '<cmd>tabnext<cr>', 'Next Tab' },
    ['<S-Tab>'] = { '<cmd>tabprevious<cr>', 'Previuos Tab' },
    ['<Leader>x'] = { '<cmd>tabclose<cr>', 'Close tab' },
    ['<Leader>e'] = { '<cmd>NvimTreeFocus<cr>', 'NvimTree: Focus' },
    ['<Leader>ee'] = { '<cmd>NvimTreeToggle<cr>', 'NvimTree: Toggle' },
    ['<Leader>f'] = { '<cmd>Lspsaga show_cursor_diagnostics<cr>', 'Diagnostic: Cursor' },
    ['<Leader>q'] = { '<cmd>Lspsaga show_buf_diagnostics<cr>', 'Diagnostic: Buffer' },
    ['<Leader>D'] = { '<cmd>Lspsaga peek_type_definition<cr>', 'LSP: Definition Type' },
    ['<Leader>ca'] = { '<cmd>Lspsaga code_action<cr>', 'LSP: Code Action' },
    ['<Leader>ra'] = { '<cmd>Lspsaga rename<cr>', 'LSP: Rename' },
    ['[d'] = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Diagnostic: Goto Prev' },
    [']d'] = { '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Diagnostic: Goto Next' },
    ['gD'] = { function() vim.lsp.buf.declaration() end, 'LSP: Declaration' },
    ['gd'] = { function() vim.lsp.buf.definition() end, 'LSP: Definition' },
    ['gr'] = { '<cmd>Lspsaga finder<cr>', 'LSP: References' },
    ['K'] = { '<cmd>Lspsaga hover_doc<cr>', 'LSP: Hover Doc' },
    ['<Leader>fs'] = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', 'Telescope: Current Buffer Search' },
    ['<Leader>ff'] = { '<cmd>Telescope find_files<cr>', 'Telescope: Find Files' },
    ['<Leader>ft'] = { '<cmd>Telescope colorscheme<cr>', 'Telescope: Find Themes' },
    ['<Leader>fk'] = { '<cmd>Telescope keymaps<cr>', 'Telescope: Find Normal Keymaps' },
    ['<Leader>fg'] = { '<cmd>Telescope live_grep<cr>', 'Telescope: Live Grep' },
    ['<Leader>fb'] = { '<cmd>Telescope buffers<cr>', 'Telescope: Buffers' },
    ['<Leader>fh'] = { '<cmd>Telescope help_tags<cr>', 'Telescope: Help Tags' },
    ['<Leader>fc'] = { '<cmd>TodoTelescope<cr>', 'Telescope: Find Todo Comments' },
    ['<Leader>gc'] = { '<cmd>Telescope git_commits<cr>', 'Telescope: Git Commits' },
    ['<Leader>gb'] = { '<cmd>Telescope git_branches<cr>', 'Telescope: Git Branches' },
    ['<Leader>gs'] = { '<cmd>Telescope git_status<cr>', 'Telescope: Git Status' },
    ['<F5>'] = { dap.continue, 'DAP: Run Debug' },
    ['<F10>'] = { dap.step_over, 'DAP: Step Over' },
    ['<F11>'] = { dap.step_into, 'DAP: Step Into' },
    ['<F12>'] = { dap.step_out, 'DAP: Step Out' },
    ['<Leader>b'] = { dap.toggle_breakpoint, 'DAP: Toggle Breakpoint' },
    ['<Leader>B'] = {
      function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
      'DAP: Set Conditional Breakpoints'
    },
    ['<Leader>ui'] = { dapui.toggle, 'DAP: Toggle UI' },
  },

  v = {
    ['x'] = { '"_x', 'Do not yank with "x"' },
    ['<A-up>'] = { ":m '<-2<CR>gv=gv", 'Move line Up' },
    ['<A-down>'] = { ":m '>+1<CR>gv=gv", 'Move line Down' },
  },

  i = {
    ['<A-up>'] = { '<Esc><cmd>m .-2<CR>==gi', 'Move line Up' },
    ['<A-down>'] = { '<Esc><cmd>m .+1<CR>==gi', 'Move line Down' },
  },
}

handle.mappings(M)
