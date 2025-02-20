local function school_path(p)
  return '~/documents/school/'..p
end

local function register_wiki (name, path)
  return {
    name = name,
    path = path,
    syntax = 'markdown',
    ext = '.md'
  }
end

vim.g.vimwiki_list = {
  register_wiki('MHL123: Music in Film',   school_path 'MHL123'),
  register_wiki('MHL325: History of Rock', school_path 'MHL325'),
}

vim.g.vimwiki_key_mappings = {
  headers = 0
}

vim.g.vimwiki_hl_cb_checked = 2
vim.g.vimwiki_global_ext = 0
