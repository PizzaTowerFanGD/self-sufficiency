-- store original function
local old_calculate_joker = Card.calculate_joker

function Card:calculate_joker(context)
local ret = old_calculate_joker(self, context)
    if self.ability and self.ability.corrupted then
        if math.random(1, 3) == 1 then
            -- skip effect
            if ret then
for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:calculate_joker({evilgroky_corrupt = true, ability = ret, card = self})
        end
            end
            return
        end
    end
    if self.suppressed then -- unused but for other mods
        return
end
    -- fallback to original
    return ret
end
SMODS.Atlas{
key='stickerstar',
path='stickerstar.png',
px=71,
py=95
}
corrupted = SMODS.Sticker{
key = "corrupted",
loc_txt = {name="Corrupted",text={"1 in 3 chance to","not trigger."}},
atlas = 'stickerstar',
badge_colour = HEX("770088"),
apply = function(self, card, val)
card.ability.corrupted = val
card.ability[self.key] = val
end,
rate = 0.4,
default_compat = true,
should_apply = function(self,b,c,d,e)
if e then 
return G.GAME.modifiers['enable_'..self.key]
elseif math.random() <= 0.4 then
return G.GAME.modifiers['enable_'..self.key]
end
return false
end
}