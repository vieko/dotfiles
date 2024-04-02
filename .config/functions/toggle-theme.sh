#!/bin/bash

# Toggle dark and light themes for pop-os, tmux, kitty, fish and neovim.

LIGHTTHEME="catppuccin-latte"
DARKTHEME="catppuccin-mocha"
VIMCONF="$HOME/.config/nvim/lua/vieko/init.lua"
KITTYCONF="$HOME/.config/kitty/themes.conf"
TMUXCONF="$HOME/.config/tmux/tmux.conf"
CURRENT_MODE=$(gsettings get org.gnome.desktop.interface color-scheme)

switch_vim_theme_inside_tmux() {
  theme_for_vim_panes=$1
  tmux list-panes -a -F '#{pane_id} #{pane_current_command}' | grep vim | cut -d ' ' -f 1 | xargs -I PANE tmux send-keys -t PANE ESCAPE \ ":set background=$theme_for_vim_panes" ENTER
}

if [ "$CURRENT_MODE" = "'prefer-dark'" ]; then
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-light' 
  gsettings set org.gnome.desktop.interface gtk-theme 'Pop'
  sed -i "s/$DARKTHEME/$LIGHTTHEME/" "$TMUXCONF" "$KITTYCONF"
  sed -i 's/dark/light/' "$VIMCONF"
  if [ -n "$TMUX" ]; then
    switch_vim_theme_inside_tmux "light"
  fi
  fish -c 'fish_config theme save "Catppuccin Latte"'
else
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface gtk-theme 'Pop-dark'
  sed -i "s/$LIGHTTHEME/$DARKTHEME/" "$TMUXCONF" "$KITTYCONF"
  sed -i 's/light/dark/' "$VIMCONF"
  if [ -n "$TMUX" ]; then
    switch_vim_theme_inside_tmux "dark"
  fi
  fish -c 'fish_config theme save "Catppuccin Mocha"'
fi

if [ -n "$TMUX" ]; then
  tmux source "$TMUXCONF"
fi

kill -SIGUSR1 $KITTY_PID
