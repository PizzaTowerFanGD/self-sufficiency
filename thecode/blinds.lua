SMODS.Atlas {
    key = "egblinds",
    path = "egblinds.png",
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
} -- thanks yahimod

evilgroky = SMODS.Blind{
	key='evilgroky',
	loc_txt={ name = 'EVIL GROKY', text = { 'Debuffs all your cards','with ranks above 7' } },
	atlas='egblinds',
	pos={y=0},
	boss_colour = HEX("000030"),
	recalc_debuff=function(self, card, from_blind)
		if card.area ~= G.jokers and not G.GAME.blind.disabled then
			if card.base.nominal > 7
			then
				return true
			end
			return false
		end
	end, -- part of func stolen from prism
	mult=2.763,
	boss={min=-2763},
}

calmgroky = SMODS.Blind{
	key='calmgroky',
	loc_txt={ name = 'Calm and Peaceful Groky', text = { 'Debuffs all your cards','with ranks below 7' } },
	atlas='egblinds',
	pos={y=1},
	boss_colour = HEX("CFCFFF"),
	recalc_debuff=function(self, card, from_blind)
		if card.area ~= G.jokers and not G.GAME.blind.disabled then
			if card.base.nominal < 7
			then
				return true
			end
			return false
		end
	end, -- part of func stolen from prism
	mult=2.763,
	boss={min=-2763},
}

swagwizard = SMODS.Blind{
	key='swagwizard',
	loc_txt={ name = 'Swag Wizard', text = { 'Debuffs all your cards','no matter what.','THY END IS NOW.' } },
	atlas='egblinds',
	pos={y=2},
	boss_colour = HEX("9000FF"),
	recalc_debuff=function(self, card, from_blind)
		if not G.GAME.blind.disabled then
			return true
		end
	end, 
	mult=276327632763,
	boss={min=-2763},
}

jimbo = SMODS.Blind{
	key='JIMBO',
	loc_txt={ name = 'JIMBO', text = { 'Debuffs all your playing cards,', 'relatively large boss blind.','Can\'t be disabled.','"The house always wins."'} },
	atlas='egblinds',
	pos={y=3},
	boss_colour = HEX("FF0000"),
	recalc_debuff=function(self, card, from_blind)
		if card.area ~= G.jokers then
			return true
		end
	end,
	mult=5,
	boss={min=38},
	cry_calc_ante_gain = function(self)
	    local displacement = 1 - G.GAME.round_resets.ante
	    return displacement
	end
}

tinyblind = SMODS.Blind{
	key='tinyblind',
	loc_txt={ name = 'Tiny Blind', text = {} },
	atlas='egblinds',
	pos={y=4},
	boss_colour = HEX("B5E8F2"),
	mult=0.5,
	boss={min=math.huge}
}

trolled = SMODS.Blind{
	key='trolled',
	loc_txt={name='The Troll', text = {"Subtracts Ante instead of adding Ante."}},
	atlas='egblinds',
	pos={y=5},
	boss_colour = HEX("FFFFFF"),
	mult=-2,
	boss={min=-math.huge},
	cry_calc_ante_gain = function(self)
	return -1
	end
	}
	
	loop1 = SMODS.Blind{
	key='loop1',
	loc_txt={name='The Loop', text = {"Debuffs all Common Jokers,","Loop 1/4."}},
	atlas='egblinds',
	pos={y=6},
	boss_colour = HEX("935ADC"),
	mult=2,
	boss={min=-math.huge},
	recalc_debuff=function(self, card, from_blind)
		if card.area == G.jokers and card.config.center.rarity == 1 and not G.GAME.blind.disabled then
			return true
		end
	end,
	cry_calc_ante_gain = function(self)
	G.egm.loopcount = 1
	return 0
	end
	}
loop2 = SMODS.Blind{
	key='loop2',
	loc_txt={name='The Loop', text = {"Debuffs all Uncommon or lower Jokers,","Loop 2/4."}},
	atlas='egblinds',
	pos={y=6},
	boss_colour = HEX("935ADC"),
	mult=3,
	boss={min=math.huge},
	recalc_debuff=function(self, card, from_blind)
	if type(card.config.center.rarity) ~= type(1) then return false end
		if card.area == G.jokers and card.config.center.rarity <=2 and not G.GAME.blind.disabled then
			return true
		end
	end,
	cry_calc_ante_gain = function(self)
	G.egm.loopcount = 2
	return 0
	end
	}
	loop3 = SMODS.Blind{
	key='loop3',
	loc_txt={name='The Loop', text = {"Debuffs all Polychrome Jokers,","Applies all previous Loops,","Loop 3/4."}},
	atlas='egblinds',
	pos={y=6},
	boss_colour = HEX("935ADC"),
	mult=5,
	boss={min=math.huge},
	recalc_debuff=function(self, card, from_blind)
	if type(card.config.center.rarity) ~= type(1) then return false end
		if card.area == G.jokers and ((card.edition and card.edition.type == "polychrome") or card.config.center.rarity <= 2) and not G.GAME.blind.disabled then
			return true
		end
	end,
	cry_calc_ante_gain = function(self)
	G.egm.loopcount = 3
	return 0
	end
	}
	loop4 = SMODS.Blind{
	key='loop4',
	loc_txt={name='The Loop', text = {"Debuffs all playing cards,","Applies all previous Loops,","Loop 4/4."}},
	atlas='egblinds',
	pos={y=6},
	boss_colour = HEX("935ADC"),
	mult=10,
	boss={min=math.huge},
	recalc_debuff = function(self, card, from_blind)
	if G.GAME.blind.disabled then return false end
	-- debuff jokers if they're polychrome or common/uncommon
	if card.area == G.jokers then
		if (card.edition and card.edition.type == "polychrome") or (type(card.config.center.rarity) == "number" and card.config.center.rarity <= 2) then
			return true
		end
	end
	-- debuff playing cards unconditionally
	if card.area ~= G.jokers then
		return true
	end
	return false
end,
	cry_calc_ante_gain = function(self)
	G.egm.loopcount = 4
	return 0
	end
	}
	trolled = SMODS.Blind{
	key='trolled2',
	loc_txt={name='Those Who Know', text = {"Set Ante to -Infinity instead of adding Ante."}},
	atlas='egblinds',
	pos={y=7},
	boss_colour = HEX("000000"),
	mult=-math.huge,
	boss={min=-math.huge},
	cry_calc_ante_gain = function(self)
	return -math.huge
	end
	}
	squam = SMODS.Blind{
	key='SQUAM',
	loc_txt={name='The SQUAM', text = {"Score at least Base^2"}},
	atlas='egblinds',
	pos={y=8},
	boss_colour = HEX("FFFF00"),
	mult=1,
	exp=2,
	boss={min=-math.huge},
	}
	monolith = SMODS.Blind{
	key='monolith',
	loc_txt={name='Maroon Monolith', text = {"Score at least Base^3."}},
	atlas='egblinds',
	pos={y=9},
	boss_colour = HEX("500000"),
	mult=1,
	exp=3,
	boss={min=-math.huge, showdown=true},
	}
	