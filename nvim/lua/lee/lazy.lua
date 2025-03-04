local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- bootstrap lazy so that neovim installs it if it isn't alreay installed
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- require and load lazy and call the setup function
-- to the plugins, the second is different options to configure lazy
require("lazy").setup({ { import = "lee.plugins" }, { import = "lee.plugins.lsp" } }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

