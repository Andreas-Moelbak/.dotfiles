return {
    --[[
    "3rd/image.nvim",
    ft = {
        "norg",
        "md"
    },
    opts = {
        backend = "kitty",
        integrations = {
            markdown = {
                enabled = true,
                sizing_strategy = "auto",
                download_remote_images = true,
                clear_in_insert_mode = false,
            },
            neorg = {
                enabled = true,
                download_remote_images = true,
                clear_in_insert_mode = false,
            },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        kitty_method = "normal",
        kitty_tmux_write_delay = 10,
    }
    --]]
}
