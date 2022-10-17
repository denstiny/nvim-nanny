local M = {}


M.mergeTable = function(table1, table2)
  local c_table = {}
  local flag

  for k, v in ipairs(table1) do
    flag = false
    for e, value in ipairs(c_table) do
      if value == v then
        flag = true
      end
    end
    if flag == false then
      table.insert(c_table, v)
    end
  end

  for k, v in ipairs(table2) do
    flag = false
    for e, value in ipairs(c_table) do
      if value == v then
        flag = true
      end
    end
    if flag == false then
      table.insert(c_table, v)
    end
  end

  return c_table
end



return M
