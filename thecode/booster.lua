SMODS.Atlas{
	key = "egmbooster",
	path = "evilpacc.png",
	px=71,
	py=95
	}
	
	egmbooster = SMODS.Booster{
	key = "evilpacc",
	kind = "EVILGROKYMOD",
	atlas = "egmbooster",
	pos = { x = 0, y = 0 },
	loc_txt = {name="Evil Pacc", text={"Choose an", "EVIL GROKY MOD", "Joker!"}},
	config = { extra = 3, choose = 1 },
	cost = 2.763,
	order = 1,
	weight = 27.63,
	create_card = function(self, card)
		return create_card("EvilGrokyMod", G.pack_cards, nil, nil, true, true, nil, "EVILGROKYMOD")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, HEX("0000CC"))
		ease_background_colour({ new_colour = HEX("0000CC"), special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "evilpacc",
}