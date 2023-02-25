local ok_status, npairs = pcall(require, 'nvim-autopairs')
if not ok_status then
    vim.notify('Not find autopairs')
    return
end

npairs.setup({
    -- use treesitter check pair
    check_ts = true,
    disable_filetype = { "TelescopePrompt" , "vim" },
    -- Don't add pairs if alredy has a close pair in the same line
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]",
})

-- nvim cmp pairs
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
-- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
