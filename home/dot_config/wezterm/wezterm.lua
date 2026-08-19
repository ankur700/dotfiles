local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- General
config.font = wezterm.font('JetBrainsMono NFM', { weight = 'Medium' })
config.font_size = 14
config.line_height = 1.2
config.color_scheme = "Catppuccin Mocha"
config.colors = {
    cursor_bg = '#7aa2f7',
    cursor_border = '#7aa2f7',
}

config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.7
config.macos_window_background_blur = 15
config.window_close_confirmation = 'NeverPrompt'
config.enable_tab_bar = true
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

-- KeyBindings
config.keys = {
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    {
        key = 'd',
        mods = 'CMD',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
}

return config
