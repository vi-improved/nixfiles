vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
require("bufferline").setup({
    options = {
        separator_style = "slant",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Browser",
                highlight = "Directory",
                text_align = "center"
            }
        }
    }
})
require("lualine").setup({
    options = {
        theme = "nord"
    },
    extensions = {"nvim-tree"},
})
require("nvim-tree").setup({
    open_on_setup = true
})
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.number = true
vim.g.termguicolor = true
vim.g.nord_borders = true
vim.cmd [[colorscheme nord]]
