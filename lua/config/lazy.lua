local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local version = "1.2"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    {
      "tokyonight.nvim",
      opts = {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      },
    },
    { "wakatime/vim-wakatime", lazy = false },
    {
      "rcarriga/nvim-notify",
      opts = {
        stages = "slide",
      },
    },
    { "itchyny/calendar.vim", lazy = false },
    { "folke/which-key.nvim", opts = {
      preset = "modern",
    } },
    -- Set default shell on terminal to fish
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    {
      "nvimdev/dashboard-nvim",
      event = "VimEnter",
      opts = function()
        local logo = [[
██╗  ██╗██████╗ ██╗  ██╗ █████╗ ██╗   ██╗██╗███╗   ███╗
██║  ██║╚════██╗██║  ██║██╔══██╗██║   ██║██║████╗ ████║
███████║ █████╔╝███████║╚█████╔╝██║   ██║██║██╔████╔██║
╚════██║██╔═══╝ ╚════██║██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║
     ██║███████╗     ██║╚█████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
     ╚═╝╚══════╝     ╚═╝ ╚════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]]

        logo = string.rep("\n", 8) .. logo .. "\n\n"

        local opts = {
          theme = "doom",
          hide = {
            statusline = false,
          },
          config = {
            header = vim.split(logo, "\n"),
            center = {
              {
                action = "Telescope find_files",
                desc = " Find File",
                icon = " ",
                key = "f",
              },
              {
                action = "ene | startinsert",
                desc = " New File",
                icon = " ",
                key = "n",
              },
              {
                action = "Telescope oldfiles",
                desc = " Recent Files",
                icon = " ",
                key = "r",
              },
              {
                action = "Telescope live_grep",
                desc = " Find Text",
                icon = " ",
                key = "g",
              },
              {
                action = "Neotree",
                desc = " File Explorer",
                icon = " ",
                key = "e",
              },
              {
                action = [[lua LazyVim.telescope.config_files()()]],
                desc = " Config",
                icon = " ",
                key = "c",
              },
              {
                action = 'lua require("persistence").load()',
                desc = " Restore Session",
                icon = " ",
                key = "s",
              },
              {
                action = "LazyExtras",
                desc = " Lazy Extras",
                icon = " ",
                key = "x",
              },
              {
                action = "Lazy",
                desc = " Lazy",
                icon = "󰒲 ",
                key = "l",
              },
              {
                action = "LazyVim.terminal()",
                desc = " Terminal",
                icon = " ",
                key = "t",
              },
              {
                action = "qa",
                desc = " Quit",
                icon = " ",
                key = "q",
              },
            },
            footer = function()
              local stats = require("lazy").stats()
              local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
              local date = os.date("%h %d %Y %H:%M")
              local username = vim.fn.expand("$USER")
              -- current folder
              local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
              -- if CWD is home folder, show ~ instead
              if cwd == username then
                cwd = "~"
              end
              return {
                "⚡ 4248vim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms ⚡",
                date .. " | " .. username .. " | " .. cwd .. " | " .. version,
              }
            end,
          },
        }

        for _, button in ipairs(opts.config.center) do
          button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
          button.key_format = "    %s"
        end

        if vim.o.filetype == "lazy" then
          vim.cmd.close()
          vim.api.nvim_create_autocmd("User", {
            pattern = "DashboardLoaded",
            callback = function()
              require("lazy").show()
            end,
          })
        end

        return opts
      end,
    },
  },

  defaults = {
    lazy = false,
    version = false,
  },

  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
