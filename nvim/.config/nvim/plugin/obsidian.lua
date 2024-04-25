local cmd = require('parmort.keymap').command
local highlight = require('parmort.util').highlight

require('obsidian').setup({
  workspaces = {
    {
      name = "vault",
      path = "~/documents/vault"
    }
  },

  mappings = {
    ['<C-]>'] = { -- Open link in vertical split
      action = cmd 'ObsidianFollowLink vsplit',
      opts = { noremap = true, buffer = true }
    },
    ['<leader>t'] = { -- Clobber telescope git mapping when in Obsidian vaults
      action = cmd 'ObsidianQuickSwitch',
      opts = { noremap = true, buffer = true }
    },
    ["gf"] = { -- Make `gf` make sense in vaults
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    ["<cr>"] = { -- Action button that makes good sense
      action = function()
        return require("obsidian").util.smart_action()
      end,
      opts = { buffer = true, expr = true },
    }
  },

  note_path_func = function(spec)
    local path = spec.dir / spec.title
    return path:with_suffix('.md')
  end,

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

  callbacks = {
    enter_note = function(_, _)
      vim.cmd [[syntax match markdownWikiLink /\[\[.*\]\]/]]
      highlight('markdownWikiLink', 'markdownLinkText')
    end
  }
})
