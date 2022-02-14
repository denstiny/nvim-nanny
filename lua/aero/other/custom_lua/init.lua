-- add startify_bookmarks
function addStartify_bookmark()
    local projectRootfile = os.getenv("HOME")
    local projectRoot =  vim.fn.expand('%:p')
    local _str = vim.fn.split(projectRoot, '/')
    local dir = ''
    for key=1,#_str-1 do
        dir = dir .. '/' ..  _str[key]
    end
    print(dir)
    dir = dir .. '\n'
    local file = io.open(projectRootfile .. '/.projectRoots', 'a')
    file:write(dir)
    file:flush()
    file:close()
    projectRoots()
end

--- setting startify_bookmarks
function projectRoots()
    local projectRoot = os.getenv("HOME")
    local file = assert(io.open(projectRoot .. '/.projectRoots', 'r'))
    local _table = vim.g.startify_bookmarks_
    for line in file:lines() do
        table.insert(_table, line)
    end
    vim.g.startify_bookmarks = _table
    file:flush()
    file:close()
end
