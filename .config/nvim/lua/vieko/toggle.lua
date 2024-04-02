function LoadCatppuccinPalette()
  local background = vim.opt.background:get()
  local paletteName = "mocha"

  if background == "light" then
    paletteName = "latte"
  end

  return require("catppuccin.palettes").get_palette(paletteName)
end
