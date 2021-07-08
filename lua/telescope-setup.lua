local telescope = require("telescope")

telescope.load_extension("frecency")
telescope.setup{
  defaults = {
    sort_lastused = true,
    sorting_strategy = "ascending",
    layout_config = {

      width = function(_, max_columns, _)
        if max_columns < 120 then
          return math.min(max_columns - 20, 68)
        else
          return math.min(max_columns - 20, 120)
        end
      end,

      height = function(_, _, max_lines)
        return math.min(max_lines - 20, 30)
      end,

      horizontal = {
        prompt_position = "top"
      },
    },
  }
}
