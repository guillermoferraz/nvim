local status, nvim_tree = pcall(require, "nvim-tree")
if (not status) then return end

nvim_tree.setup {
  open_on_tab = true,
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  view = {
    side = "right",
  },
}

-- mappings
vim.keymap.set('n', '<space>e', '<cmd>:NvimTreeToggle<CR>', { silent = true })
