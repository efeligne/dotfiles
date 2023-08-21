local configuration = {
  auto_reload_on_write = true,
  sort = {
    sorter = "name",
    folders_first = true,
  },
  git = {
    enable = true,
  },
  filters = {
    git_ignored = false,
    custom = {
      "node_modules"
    },
  },
  renderer = {
    highlight_git = true,
    group_empty = true,
    icons = {
      show = {
        git = false,
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
}

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup(configuration)
  end
}
