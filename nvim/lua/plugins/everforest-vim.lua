-- lua/plugins/everforest.lua
return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("everforest").setup({
      background = "soft",
      italics = true,

    })
  end,
}

