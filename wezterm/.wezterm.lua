local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Lilex Nerd Font")
config.font_size = 19

config.window_decorations = "RESIZE"

config.colors = {
    foreground = "#CBE0F0",
    background = "#000000",
    cursor_bg = "#47FF9C",
    cursor_border = "#47FF9C",
    cursor_fg = "#011423",
    selection_bg = "#003259",
    selection_fg = "#CBE0F0",
    ansi = { "#214969", "#AE52E2", "#44FFB1", "#FFE073", "#0FC5ED", "#A277FF", "#24EAF7", "#24EAF7" },
    brights = { "#214969", "#5E5E2E", "#44FFB1", "#FFE073", "#A277FF", "#24EAF7", "#24EAF7", "#24EAF7" },

    tab_bar = {
        background = "#000000", -- Match the terminal background
        active_tab = {
            bg_color = "#47FF9C",
            fg_color = "#011423",
            intensity = "Bold",
            underline = "None",
        },
        inactive_tab = {
            bg_color = "#000000", -- Same color as the terminal background
            fg_color = "#CBE0F0",
        },
        inactive_tab_hover = {
            bg_color = "#0FC5ED",
            fg_color = "#011423",
            italic = true,
        },
        new_tab = {
            bg_color = "#000000",
            fg_color = "#CBE0F0",
        },
        new_tab_hover = {
            bg_color = "#5E5E2E",
            fg_color = "#CBE0F0",
            italic = true,
        },
    }
}

config.window_background_opacity = 0.8
config.macos_window_background_blur = 25

config.use_fancy_tab_bar = false

wezterm.on("format-tab-title", function(tab)
    local pane = tab.active_pane
    local title = pane.title or "[No Name]" -- Default to "[No Name]" if title is nil

    -- Extract just the filename from the title (assuming it's a path)
    local filename = title:match("[^/\\]+$") or "[No Name]" -- Ensure filename is not nil

    -- Determine icon by process or file extension
    local icon = "" -- Default icon

    -- Match file extensions in the correct order to avoid mismatches
    if filename:find("%.tsx$") or filename:find("%.jsx$") then
        icon = "" -- React Icon for TSX and JSX files
    elseif filename:find("%.ts$") then
        icon = "" -- TypeScript Icon for TS files
    elseif filename:find("%.lua$") then
        icon = "" -- Lua Icon
    elseif filename:find("%.c$") then
        icon = "" -- C Icon
    elseif filename:find("%.js$") then
        icon = "" -- JavaScript Icon
    elseif filename:find("%.html$") then
        icon = "" -- HTML Icon
    elseif filename:find("%.css$") then
        icon = "" -- CSS Icon
    elseif filename:find("tailwind") then
        icon = "󱏿" -- Tailwind Icon
    elseif pane.foreground_process_name:find("zsh") then
        icon = "" -- Zsh Icon
    elseif pane.foreground_process_name:find("python") then
        icon = "" -- Python Icon
    elseif pane.foreground_process_name:find("node") then
        icon = "" -- Node.js Icon
    end

    return " " .. icon .. "  " .. filename .. " "
end)

return config
