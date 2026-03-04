return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  -- Wichtig: opts ist IMMER eine Tabelle (mindestens {})
  opts = {},

  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle left<CR>", { silent = true })
  end,
}
