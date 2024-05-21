local function merge_config(c1, c2)
  local result = {}
  result = vim.tbl_extend('force', result, c1)
  result = vim.tbl_extend('force', result, c2)
  return result
end

return { merge_config = merge_config }
