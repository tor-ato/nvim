return {
  "numToStr/Comment.nvim",
  opts = {
    ignore_blank_line = true,
    start_of_line = true,
  },
  toggler = {
    ---Line-comment toggle keymap
    line = "gcc",
    ---Block-comment toggle keymap
    block = "gbc",
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = "gc",
    ---Block-comment keymap
    block = "gb",
  },
}
