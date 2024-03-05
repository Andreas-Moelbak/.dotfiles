---@type Wezterm
local wezterm = require("wezterm")
local config = wezterm.config_builder()

wezterm.log_info("reloading")


config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- Colorscheme
--config.color_scheme_dirs = { wezterm.home_dir .. "/projects/tokyonight.nvim/extras/wezterm" }
--config.color_scheme = "tokyonight_night"
--wezterm.add_to_config_reload_watch_list(config.color_scheme_dirs[1] .. config.color_scheme .. ".toml")
--
local colors = require('lua/rose-pine-moon').colors()
--local window_frame = require('lua/rose-pine').window_frame()
config.colors = colors
--config.window_frame = window_frame, -- needed only if using fancy tab bar

-- Window
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

--config.term = 'screen-256color'
-- Fonts
config.font_size = 15
config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.bold_brightens_ansi_colors = true
-- Diable ligatures
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

-- Cursor
--config.default_cursor_style = "BlinkingBar"
--config.force_reverse_video_cursor = true
config.window_padding = { left = 20, right = 20, top = 20, bottom = 20 }
-- window_background_opacity = 0.9,
-- cell_width = 0.9,
config.scrollback_lines = 10000

config.enable_kitty_keyboard = true
config.enable_csi_u_key_encoding = true
--config.disable_default_key_bindings = true
config.debug_key_events = true
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

   -- similarly, don't ask the macOS IME/text services to compose input
config.use_ime = false

return config --[[@as Wezterm]]
