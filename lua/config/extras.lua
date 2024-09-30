vim.api.nvim_create_user_command('Wttr', function(opts)
	vim.cmd('new')
	vim.cmd('term curl wttr.in/London')
end, {
	nargs = 0,
})

vim.api.nvim_create_user_command('StarWars', function(opts)
	vim.cmd('new')
	vim.cmd('term telnet towel.blinkenlights.nl')
end, {
	nargs = 0,
})