local wezterm = require("wezterm")

local act = wezterm.action

local config = wezterm.config_builder()

config.default_prog = { "ubuntu" }

config.color_scheme = "Gruvbox light, medium (base16)"

local commit_mono = { family = "CommitMono", italic = false }
local fira_code_nerd_font =
	{ family = "FiraCode Nerd Font Ret", scale = 0.97, harfbuzz_features = { "cv02", "cv10", "cv13", "ss08" } }
local chill_kai = { family = "ChillKai", scale = 1.25 }
local lxgw_wenkai = { family = "LXGW WenKai", scale = 1.15 }
local custom_font_regular = wezterm.font_with_fallback({ commit_mono, fira_code_nerd_font, chill_kai, lxgw_wenkai })
local custom_font_italic = wezterm.font_with_fallback({ commit_mono, fira_code_nerd_font, chill_kai, lxgw_wenkai })

config.font_size = 18

config.font = custom_font_regular

config.font_rules = {
	{ intensity = "Half", italic = false, font = custom_font_regular },
	{ intensity = "Normal", italic = false, font = custom_font_regular },
	{ intensity = "Bold", italic = false, font = custom_font_regular },
	{ intensity = "Half", italic = true, font = custom_font_italic },
	{ intensity = "Normal", italic = true, font = custom_font_italic },
	{ intensity = "Bold", italic = true, font = custom_font_regular },
}

-- Keymaps
config.disable_default_key_bindings = true
config.keys = {
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard"), description = "Paste from the clipboard" },
	{ key = "Backspace", mods = "CTRL", action = act.SendKey({ key = "w", mods = "CTRL" }) },
}

config.enable_tab_bar = false

config.max_fps = 160

config.front_end = "WebGpu" -- `WebGpu`, `OpenGL`

-- And finally, return the configuration to wezterm
return config
