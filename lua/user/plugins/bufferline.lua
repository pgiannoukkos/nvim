return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup({
            options = {
                mode = 'buffers',                    -- set to "tabs" to only show tabpages instead
                -- style_preset = bufferline.preset.default,
                themable = true,                     -- allows highlight groups to be overriden i.e. sets highlights as default
                numbers = 'none',                    -- "ordinal" | "buffer_id" | "both"
                close_command = 'Bdelete! %d',       -- can be a string | function, | false see "Mouse actions"
                right_mouse_command = 'Bdelete! %d', -- can be a string | function | false, see "Mouse actions"
                left_mouse_command = 'buffer %d',    -- can be a string | function, | false see "Mouse actions"
                middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
                indicator = {
                    icon = '▎',                    -- this should be omitted if indicator style is not 'icon'
                    style = 'icon',                  -- | 'underline' | 'none',
                },
                buffer_close_icon = '',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                max_name_length = 30,
                max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
                truncate_names = true,  -- whether or not tab names should be truncated
                tab_size = 20,
                diagnostics = false,
                diagnostics_update_in_insert = false,
                -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
                -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
                --     return "(" .. count .. ")"
                -- end,
                offsets = {
                    {
                        filetype = 'NvimTree',
                        text = 'File Explorer',
                        text_align = 'center',
                        separator = true,
                    },
                },
                color_icons = true, -- whether or not to add the filetype icon highlights
                get_element_icon = function(element)
                    local icon, hl =
                        require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = true })
                    return icon, hl
                end,
                show_buffer_icons = true, -- disable filetype icons for buffers
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
                persist_buffer_sort = true,   -- whether or not custom sorted buffers should persist
                separator_style = 'slant',    -- "slope" "thick" "thin" { 'any', 'any' }
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { 'close' },
                },
                -- sort_by = "insert_after_current", -- |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs'    }
            },
        })
    end,
}
