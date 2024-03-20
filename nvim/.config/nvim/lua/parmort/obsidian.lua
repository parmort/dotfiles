local cmd = require('parmort.util.keymap').command

local config = {
  workspaces = {
    {
      name = "vault",
      path = "~/documents/vault"
    }
  },

  mappings = {
    ['<C-]>'] = {
      action = cmd 'ObsidianFollowLink vsplit',
      opts = { noremap = true, buffer = true }
    },
    ['<leader>t'] = {
      action = cmd 'ObsidianQuickSwitch',
      opts = { noremap = true, buffer = true }
    }
  },

  note_path_func = function(spec)
    local path = spec.dir / spec.title
    return path:with_suffix('.md')
  end,

  ---@param note obsidian.Note
  ---@return table|?
  note_frontmatter_func = function(note)
    if note.title then
      note:add_alias(note.title)
    end

    local out = { aliases = note.aliases, tags = note.tags }

    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,
}

require('obsidian').setup(config)
