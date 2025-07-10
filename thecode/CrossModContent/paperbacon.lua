if PB_UTIL and PB_UTIL.config.paperclips_enabled then
SMODS.Atlas {
	key = "clippy",
	path = "clippy.png",
	px=71,
	py=95
	}
PB_UTIL.Paperclip {
  key = 'cyan_clip',
  loc_txt = {name="Cyan Clip", text={"evil groky joker but as a paperclip :scream:"}},
  atlas = 'clippy',
  pos = { x = 0, y = 0 },
  badge_colour = G.C.CLUBS,
  badge_text_colour = G.C.PAPERBACK_BLACK,
  config = {
    mult_mod = 1.1,
    mult = 1
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability[self.key].mult_mod,
        card.ability[self.key].mod
      }
    }
  end,

  calculate = function(self, card, context)

    if context.individual and context.cardarea == G.play then
      local mult = card.ability[self.key].mult
      local mult_mod = card.ability[self.key].mult_mod
      card.ability[self.key].mult = mult * mult_mod
      if mult ~= 0 then
        return {
          mult_mod = mult,
          mult = mult
        }
      end
    end
  end
}
-- shamelessly stolen
function PB_UTIL.is_paperclip(str)
  for _, v in ipairs(PB_UTIL.ENABLED_PAPERCLIPS) do
    if 'paperback_' .. v == str or str == "selfsuff_cyan_clip" then
      return true
    end
  end
  return false
end


-- do the yoinky sploinky
function PB_UTIL.set_paperclip(card, type)
  local key = 'paperback_' .. type .. '_clip'
if type == "egmcyan" then key = "selfsuff_cyan_clip" end
  if card and PB_UTIL.is_paperclip(key) then
    PB_UTIL.remove_paperclip(card)
    SMODS.Stickers[key]:apply(card, true)
  end
end
end

if PB_UTIL and PB_UTIL.MinorArcana then
SMODS.Atlas {
	key = "diddy",
	path = "diddy.png",
	px=71,
	py=95
	}
PB_UTIL.MinorArcana {
  key = 'a_kind_of_somethings', -- aikoyori's shenanagens reference (HOW DO I SPEL)
  config = {
    paperclip = 'egmcyan',
    max_highlighted = 1e5
  },
  atlas = 'diddy',
  pos = { x = 0, y = 0 },
  paperback = {
    requires_paperclips = true
  }
}
end



