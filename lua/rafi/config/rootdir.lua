-- ~/.config/nvim/lua/config/rootdir.lua

local root_markers = { ".git", "package.json", "pyproject.toml", "go.mod", "Cargo.toml" }

-- 判断路径下是否存在 marker 文件或目录
local function has_marker(path)
  for _, marker in ipairs(root_markers) do
    local full_path = path .. "/" .. marker
    if vim.loop.fs_stat(full_path) then
      return true
    end
  end
  return false
end

-- 从当前目录向上查找项目根
local function find_root(start_path)
  local path = vim.fn.fnamemodify(start_path or vim.fn.getcwd(), ":p")
  local last_path = nil

  while path ~= last_path do
    if has_marker(path) then
      return path
    end
    last_path = path
    path = vim.fn.fnamemodify(path, ":h") -- 上一级目录
  end

  -- 一直没找到，返回起始目录
  return start_path
end

-- VimEnter 时设置工作目录
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local buf_path = vim.fn.expand("%:p:h")
    local start_path = buf_path ~= "" and buf_path or vim.fn.getcwd()
    local root = find_root(start_path)
    vim.cmd("cd " .. root)
  end,
})
