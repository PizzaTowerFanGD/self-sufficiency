if CardSleeves then
SMODS.Atlas {
	key="evilsleevey",
	path="evilsleevey.png",
	px=73,
	py=95
	}
CardSleeves.Sleeve {
	key = "verdantsleeve",
	atlas = "evilsleevey",
	pos = {x=0,y=0},
	loc_vars = function(self)
	local key
	local vars = {}
	if self.get_current_deck_key() == verdantdeck.key then
	key = self.key .. "_alt"
	end
	return {key=key, vars = vars}
	end,
	apply=function(self)
	G.GAME.finisher_on_half_win = true
	if self.get_current_deck_key() == verdantdeck.key then
	G.GAME.finisher_on_quarter_win = true
	end
	end
	}
	end