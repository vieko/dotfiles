local M = {}

---@param ns string
---@return nil
function M.reload_config(ns)
  ns = ns or "vieko"

  for name, _ in pairs(package.loaded) do
    if name:match("^" .. ns) then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)

  vim.cmd("PackerCompile")
end

return M
