#!/usr/bin/env bash
set -eu

repo="$(cd -- "$(dirname -- "$0")" && pwd -P)"
config="${XDG_CONFIG_HOME:-$HOME/.config}"

mkdir -p "$config/wezterm"
ln -sT --backup=numbered "$repo/config/wezterm/wezterm.lua" "$config/wezterm/wezterm.lua"
ln -sT --backup=numbered "$repo/config/starship.toml" "$config/starship.toml"

mkdir -p "$config/hypr"
ln -sT --backup=numbered "$repo/config/hypr/hyprland.lua" "$config/hypr/hyprland.lua"
ln -sT --backup=numbered "$repo/config/hypr/modules" "$config/hypr/modules"
