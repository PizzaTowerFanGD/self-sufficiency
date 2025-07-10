if togabalatro then
SMODS.Atlas{
key = "toga",
path = "toga.png",
px=71,
py=95
}
togaxp = SMODS.Joker{
key = "xp",
loc_txt = {name="Windows XP Upgrade", text={"Doubles all future Joker values.","(if this even works, which i doubt)"}},
atlas = "toga",
add_to_deck = function(self, card, from_debuff)
		G.GAME.has_xp_upgrade = true
end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.has_xp_upgrade = false
end,
}
end