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

_getbossfuncOLD_EVILGROKYMOD = get_new_boss
function get_new_boss()
if G.GAME.round_resets.ante >= 38 then
return jimbo.key
end
return _getbossfuncOLD_EVILGROKYMOD()
end