local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font({
	family = "Moralerspace Neon HWNF",
	harfbuzz_features = {
		"calt=1",
		"ss01=0",
		"ss02=0",
		"ss03=1",
		"ss04=0",
		"ss05=0",
		"ss06=1",
		"ss07=0",
		"ss08=0",
		"ss09=0",
		"liga=1",
	},
})

config.font_size = 16

config.color_scheme = "Kasugano (terminal.sexy)"

return config
