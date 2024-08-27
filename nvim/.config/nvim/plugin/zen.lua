require('zen-mode').setup({
  window = {
    backdrop = 1,
    width = 80,
    options = {
      number = false,
      relativenumber = false,
      cursorline = false
    }
  },
  plugins = {
    twilight = { enabled = false }, -- handle twilight enabling myself
    tmux = { enabled = true } -- hide tmux status
  },
  on_open = require('parmort.zen').enter
})
