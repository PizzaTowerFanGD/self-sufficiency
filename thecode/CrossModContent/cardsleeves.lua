if CardSleeves then

SMODS.Atlas {
	key = "dicks_sleeves",
	path = "evilsleevey.png",
	px = 73,
	py = 95
}

CardSleeves.Sleeve {
	key = "weesleeve",
	atlas = "dicks_sleeves",
	pos = {x = 1, y = 0},
	apply = function(self)
		if self.get_current_deck_key() == "weedeck" then
			G.E_MANAGER:add_event(Event({
				func = function()
					for i = #G.playing_cards, 1, -1 do
						local card = G.playing_cards[i]
						local id = card:get_id()
						if id > 7 and id ~= 14 then
							card:remove_from_deck()
							card:remove()
							card = nil
						end
					end
					return true
				end
			}))
		end
	end
}

CardSleeves.Sleeve {
	key = "whoppersleeve",
	atlas = "dicks_sleeves",
	pos = {x = 0, y = 1},
	apply = function(self)
		if self.get_current_deck_key() == "whopperdeck" then
			G.E_MANAGER:add_event(Event({
				func = function()
					for i = #G.playing_cards, 1, -1 do
						local card = G.playing_cards[i]
						local id = card:get_id()
						if id < 8 then
							card:remove_from_deck()
							card:remove()
							card = nil
						end
					end
					return true
				end
			}))
		end
	end
}

CardSleeves.Sleeve {
	key = "wediumsleeve",
	atlas = "dicks_sleeves",
	pos = {x = 1, y = 1},
	apply = function(self)
		if self.get_current_deck_key() == "wediumdeck" then
			G.E_MANAGER:add_event(Event({
				func = function()
					for i = #G.playing_cards, 1, -1 do
						local card = G.playing_cards[i]
						local id = card:get_id()
						if not (id >= 4 and id <= 10) then
							card:remove_from_deck()
							card:remove()
							card = nil
						end
					end
					return true
				end
			}))
		end
	end
}

CardSleeves.Sleeve {
	key = "verdantsleeve",
	atlas = "dicks_sleeves",
	pos = {x = 0, y = 0},
	loc_vars = function(self)
		local key
		local vars = {}
		if self.get_current_deck_key() == verdantdeck.key then
			key = self.key .. "_alt"
		end
		return {key = key, vars = vars}
	end,
	apply = function(self)
		G.GAME.finisher_on_half_win = true
		if self.get_current_deck_key() == verdantdeck.key then
			G.GAME.finisher_on_quarter_win = true
		end
	end
}

end