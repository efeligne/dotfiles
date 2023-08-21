local handle = {}

function handle.mappings(mappings)
  for mode, mode_values in pairs(mappings) do
    for keybind, mapping_info in pairs(mode_values) do
      local opts = {}
      opts.desc = mapping_info[2]
      opts.silent = true
      vim.keymap.set(mode, keybind, mapping_info[1], opts)
    end
  end
end

return handle
