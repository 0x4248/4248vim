vim.api.nvim_create_user_command("Wttr", function(opts)
  vim.cmd("new")
  vim.cmd("term curl wttr.in/London")
end, {
  nargs = 0,
})

vim.api.nvim_create_user_command("StarWars", function(opts)
  vim.cmd("new")
  vim.cmd("term telnet towel.blinkenlights.nl")
end, {
  nargs = 0,
})

vim.api.nvim_create_user_command("X4248pull", function(opts)
  vim.cmd("!cd ~/.config/nvim && git pull")
  vim.cmd('echo "4248 Config updated. Please restart neovim."')
end, {
  nargs = 0,
})
