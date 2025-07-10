SMODS.Atlas{
	key = "egmbooster",
	path = "paccs.png",
	px=71,
	py=95
	}
	SMODS.Atlas{
	key = "negabooster",
	path = "negapack.png",
	px=71,
	py=95
	}
	egmbooster = SMODS.Booster{
	key = "evilpacc",
	kind = "EVILGROKYMOD",
	atlas = "egmbooster",
	pos = { x = 0, y = 0 },
	loc_txt = {name="Evil Pacc", text={"Choose 1 from 3", "Self Sufficiency", "Jokers!"}},
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

egmbooster2 = SMODS.Booster{
	key = "evilpacc2",
	kind = "EVILGROKYMOD",
	atlas = "egmbooster",
	pos = { x = 1, y = 0 },
	loc_txt = {name="Fat Evil Pacc", text={"Choose 1 from 5", "Self Sufficiency", "Jokers!"}},
	config = { extra = 5, choose = 1 },
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
egmbooster3 = SMODS.Booster{
	key = "evilpacc3",
	kind = "EVILGROKYMOD",
	atlas = "egmbooster",
	pos = { x = 2, y = 0 },
	loc_txt = {name="Obese Evil Pacc", text={"Choose 2 from 5", "Self Sufficiency", "Jokers!"}},
	config = { extra = 5, choose = 2 },
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

negapack = SMODS.Booster{
	key = "negapack",
	kind = "Joker",
	atlas = "negabooster",
	pos = { x = 0, y = 0 },
	loc_txt = {name="Negative Booster Pack", text={"Choose 1 from 3", "Negative Jokers"}},
	config = { extra = 3, choose = 1 },
	cost = 7,
	order = 1,
	weight = 0.25,
	 -- to create a booster pack of negative jokers
 create_card = function(self, card)
     return {set = "Joker", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "evilgroky", edition = "e_negative"}
 end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, HEX("0000CC"))
		ease_background_colour({ new_colour = HEX("0000CC"), special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "negapack",
}