return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      local logo = [[
██╗  ██╗██████╗ ██╗  ██╗ █████╗ ██╗   ██╗██╗███╗   ███╗
██║  ██║╚════██╗██║  ██║██╔══██╗██║   ██║██║████╗ ████║
███████║ █████╔╝███████║╚█████╔╝██║   ██║██║██╔████╔██║
╚════██║██╔═══╝ ╚════██║██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║
     ██║███████╗     ██║╚█████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
     ╚═╝╚══════╝     ╚═╝ ╚════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]]

      -- Add blank lines for spacing
      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"), -- Split the logo into lines for the header
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
              action = "lua LazyVim.pick_config_files()",
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
            local version = "1.2"
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            local date = os.date("%h %d %Y %H:%M")
            local username = vim.fn.expand("$USER")
            local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            
            -- If the current directory is the home folder, display it as "~"
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

      -- Adjust the descriptions to have consistent lengths
      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "    %s"
      end

      -- Close the dashboard if lazy is already open
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      -- Set up the dashboard with the final options
      require("dashboard").setup(opts)
    end,
  }
}
