local ccr = create_card
create_card = function(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)

local card = ccr(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
local ret = {}
if G.GAME.all_rank then
SMODS.change_base(card,nil,G.GAME.all_rank)
end
if _type == "Joker" and G.GAME.has_xp_upgrade then
			cry_misprintize(card,{min = 2, max = 2}, nil, true)
	end
return card
end

print("maximal j")