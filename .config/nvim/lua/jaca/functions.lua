-- Remove white spaces in the end of line
-- %s/\s\+$//e

local function remove_trailing_whitespace()
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  for i, line in ipairs(lines) do
    lines[i] = line:gsub("%s+$", "")
  end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end

vim.api.nvim_create_user_command('RemoveTrailingWhitespace', remove_trailing_whitespace, { desc = 'Remove trailing whitespace of file' })

local function align_to_the_initial_column()
  local function real_columns(str, limit)
    local columns = 0
    for i = 1, limit do
      if str:sub(i, i) == "\t" then
        columns = columns + vim.bo.tabstop
      else
        columns = columns + 1
      end
    end
    return columns
  end

  local function real_char_count(str, limit)
    local count = 0
    local i = 1
    while i < limit do
      count = count + 1
      if str:sub(i, i) == "\t" then
        i = i + vim.bo.tabstop
      else
        i = i + 1
      end
    end
    return count
  end

  local current_row = vim.fn.line("'<")
  local last_row = vim.fn.line("'>")
  local start_col = vim.fn.col("'<") - 1 -- where the cursor is
  start_col = real_columns(vim.fn.getline(current_row), start_col)
  local start_indent = vim.fn.indent(current_row)
  local insert_spaces = string.rep(" ", start_col - start_indent)

  repeat
    current_row = current_row + 1
    local line = vim.fn.getline(current_row)
    local insert_column = real_char_count(line, start_indent)
    vim.api.nvim_buf_set_text(0, current_row-1, insert_column, current_row-1, insert_column, { insert_spaces })
  until current_row >= last_row
end

vim.api.nvim_create_user_command('AlignToTheInitialColumn', align_to_the_initial_column, { range = true, desc = 'Align text to the right, duh' })

local function find_file_under_cursor()
  local path = vim.fn.expand('<cfile>')
  if path == "" then return end

  while path ~= "" do
    local file = vim.fn.findfile(path, vim.fn.getcwd() .. "/**")
    if file ~= "" then
      vim.api.nvim_command("edit " .. vim.fn.fnameescape(file))
      return
    end

    -- while file not empty remove up to the next slash
    local slash_index = path:find("/")
    if not slash_index then
      break
    end
    path = path:sub(slash_index + 1)
  end

  vim.api.nvim_echo({{ "File not found in working directory", "WarningMsg" }}, false, {})
end

vim.api.nvim_create_user_command('FindFileUnderCursor', find_file_under_cursor, { desc = 'Go to file at cursor' })

