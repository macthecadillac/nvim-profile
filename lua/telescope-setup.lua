local telescope = require("telescope")

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
        return math.max(math.min(max_lines - 20, 30), 18)
      end,

      horizontal = {
        preview_width = function(_, max_columns, _)
          return math.min(max_columns - 35, 80)
        end,
        prompt_position = "top"
      },
    },
  }
}
