local config = {}

function config.autopair()
    require('nvim-autopairs').setup({
        disable_filetype = { 'TelescopePrompt', 'vim' },
    })
    local cmp = require('cmp')
    cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
end

function config.autosave()
    require('auto-save').setup({
        trigger_events = { 'BufDelete' },
        debounce_delay = 5000,
    })
end

function config.autotag()
    require('nvim-ts-autotag').setup({})
end

function config.comment()
    require('Comment').setup({})
end

return config
