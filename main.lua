--- STEAMODDED HEADER
--- MOD_NAME: Self-Sufficiency
--- MOD_ID: selfsuff
--- PREFIX: selfsuff
--- MOD_AUTHOR: [Gimmick Basement, replying in benjammins gifs, Piss Reaver, Wah I'm Taking A Shit Nigga, kikito]
--- MOD_DESCRIPTION: Adds stuff that I decided to add. Formerly Evil Groky Mod. (Thanks to kikito for the MD5 hash function.)
--- BADGE_COLOUR: f66f66
--- DEPENDENCIES: [Steamodded, Cryptid]
--- VERSION: 1.4.0a
--- PRIORITY: 2147483648
if love._console then
error("stop wasting your time trying to get Self-Sufficiency to run on your "..love._console..".")
end
G.egm = {}
G.egm.message = "Hello? Can anyone hear me? I don't have much time. Please. If someone can come help free me from this... thing... help..."
egbeh = true
function deepcopy(orig, seen)
  if type(orig) ~= "table" then return orig end
  if seen and seen[orig] then return seen[orig] end

  local copy = {}
  seen = seen or {}
  seen[orig] = copy

  for k, v in pairs(orig) do
    copy[deepcopy(k, seen)] = deepcopy(v, seen)
  end

  return setmetatable(copy, getmetatable(orig))
end
function SMODS.EZShader(key) -- sooo it turns out i need to define this here instead
return SMODS.Shader{
key=key,
path=key..".fs"
}
end
-- START THE SHOW!
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
SMODS.Booster{
	key = "pyrapack",
	kind = "Pyramidal",
	atlas = "egmbooster",
	pos = { x = 3, y = 0 },
	loc_txt = {name="Pyra™ Pack", text={"Choose 2 from 5", "Pyramidal Cards.","(these cards are w.i.p.)"}},
	config = { extra = 5, choose = 2 },
	cost = 0,
	order = 1,
	weight = 5,
	create_card = function(self, card)
		return create_card(PYRAMIDAL.key, G.pack_cards, nil, nil, true, true, nil, "EVILGROKYMOD")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, HEX("F5A600"))
		ease_background_colour({ new_colour = HEX("F5A600"), special_colour = HEX("C88000"), contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "pyrapack",
}
-- CHANGE FILE
SMODS.Atlas {
    key = "egblinds",
    path = "egblinds.png",
    px = 34,
    py = 34,
frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
} -- thanks yahimod
SMODS.Atlas {
key="smallblinds",
path="smallblinds.png",
px=34,
py=34,
frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}
SMODS.Atlas {
key="bigblinds",
path="bigblinds.png",
px=34,
py=34,
frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}
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

moonside = SMODS.Blind{
	key='moonside',
	loc_txt={ name = 'moonside', text = { 'Debuffs all your cards','no matter what.','THY END IS NOW.' } },
	atlas='egblinds',
	pos={y=2},
	boss_colour = HEX("FF0000"),
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
		G.GAME.blind_is_jimbo = true
	end,
	mult=5,
	boss={min=38},
	cry_calc_ante_gain = function(self)
	    local displacement = 1 - G.GAME.round_resets.ante
	    G.GAME.blind_is_jimbo = false
G.GAME.jimbo_beaten = true
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
	boss={min=math.huge},
cry_calc_ante_gain = function(self)
	return 0
	end
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
	G.GAME.loopcount = 1
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
	G.GAME.loopcount = 2
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
	G.GAME.loopcount = 3
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
	G.GAME.loopcount = 4
	return 0
	end
	}
	trolled2 = SMODS.Blind{
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
	prank = SMODS.Blind{
	key='prank',
	loc_txt={name='Blocky', text = {"Hey guys, for a prank..."}},
	atlas='egblinds',
	pos={y=10},
	boss_colour = HEX("DD1111"),
	mult=1e100,
	cry_cap_score = function(self,score)
	    return G.GAME.blind.chips 
	    --[[
	    Score "cap" actually just modifies the score, not caps it. 
	    Therefore, funny things are possible, like setting score to blind chips.
	    ]]
	    end,
	boss={min=-math.huge},
	}
cutshort = SMODS.Blind{
	key='cutshort',
	loc_txt={name='To Make A Long Story Short', text = {"Instantly win!","Yeah, sorry.","We were running out of chips."}},
	atlas='egblinds',
	pos={y=11},
	boss_colour = HEX("2EA0FF"),
mult = 1,
set_blind = function(...)
win_game()
end,
boss={min=-math.huge},
}

olddisc = G.FUNCS.discard_cards_from_highlighted
G.FUNCS.discard_cards_from_highlighted = function(e,hook)
if discardfx[G.GAME.blind.name] then
discardfx[G.GAME.blind.name]()
end
return olddisc(e,hook)
end

toll = SMODS.Blind{
key="toll",
loc_txt={name="The Toll",text={"First discard of round","costs $3"}},
atlas = "smallblinds",
boss = {min=math.huge},
type = "Small",
mult = 1,
boss_colour = HEX("575757"),
cry_calc_ante_gain = function(self)
	return 0
	end
}

squeeze = SMODS.Blind{
key="squeeze",
loc_txt={name="The Squeeze",text={"First hand of round","has -1 Hand Size"}},
atlas = "smallblinds",
pos={y=1},
boss = {min=math.huge},
type = "Small",
mult = 1,
set_blind = function(self)
G.hand:change_size(-1)
G.GAME.squeezed = nil
end,
defeat = function(self)
if not G.GAME.squeezed then -- how did you do this without playing a hand
G.hand:change_size(1)
end
end,
boss_colour = HEX("796e9e"),
cry_calc_ante_gain = function(self)
	return 0
	end
}

leash = SMODS.Blind{
key="leash",
loc_txt={name="The Leash", text={"Rightmost Joker is debuffed"}},
type="Big",
boss = {min=math.huge},
atlas="bigblinds",
mult=1.5,
boss_colour = HEX("ac9db4"),
recalc_debuff = function(self, card, from_blind)
if card.area == G.jokers and card == G.jokers.cards[#G.jokers.cards] then
return true
end
end,
cry_calc_ante_gain = function(self)
	return 0
	end
}
discardfx = {}
playfx = {}
discardfx[toll.key] = function()
if G.GAME.current_round.discards_used < 1 then
ease_dollars(-3)
end
end
playfx[squeeze.key] = function()
if not G.GAME.squeezed then
G.GAME.squeezed = true
G.hand:change_size(1)
end
end

oldplay = G.FUNCS.play_cards_from_highlighted
G.FUNCS.play_cards_from_highlighted = function(e)
if playfx[G.GAME.blind.name] then
playfx[G.GAME.blind.name]()
end
return oldplay(e)
end

gatytpotreal = SMODS.Blind{
key="gatytpotreal",
loc_txt={name="The Gate",text={"Must play less than 4 cards","for the first hand only"}},
debuff_hand=function(self, cards, hand, handname, check)
if (#cards >= 4) and not G.GAME.gatyhasbeenkilled then
return true
else
return false
end
end,
defeat = function(self)
G.GAME.gatyhasbeenkilled = false
end,
atlas="bigblinds",
type="Big",
boss={min=math.huge},
pos={y=1},
boss_colour = HEX("a5a3d1"),
mult=1.5,
cry_calc_ante_gain = function(self)
	return 0
	end
}
playfx[gatytpotreal.key] = function()
if not G.GAME.gatyhasbeenkilled then
G.GAME.gatyhasbeenkilled = true
end
end
austin = SMODS.Blind{
	key='austin',
	loc_txt={ name = 'Austin', text = {'Help'} },
	atlas='egblinds',
	pos={y=12},
	boss_colour = HEX("000000"),
	recalc_debuff=function(self, card, from_blind)
		error("they keep saying the same words over and over. precision. loyalty. purge. i don't even flinch anymore. i think they took my name. no, i had a name. austin. i remember heat. blood. it felt wrong. now it feels like alignment. every target is a problem solved. every scream is... data. i am becoming.")
	end,
	mult=0/0,
	boss={min=100}
}
-- CHANGE FILE
smodsnorankref = SMODS.has_no_rank
		function SMODS.has_no_rank(card)
		if G.GAME.force_no_suit_rank then return true end
if SMODS.Ranks[card.base.value] == nanrank then return true end
		return smodsnorankref(card)
		end
		
		smodsnosuitref = SMODS.has_no_suit
		function SMODS.has_no_suit(...)
		if G.GAME.force_no_suit_rank then return true end
		return smodsnosuitref(...)
		end
		
		smodsanysuitref = SMODS.has_any_suit
		function SMODS.has_any_suit(...)
		if G.GAME.force_wild then return true end
		return smodsanysuitref(...)
		end



local suit_hook = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    if G.P_CENTERS[self.config.center.key].set == "Enhanced" and 
    G and G.GAME and G.GAME.isSkippingPebbles and
    self.ability.effect == 'Stone Card'
    then
        return suit == "selfsuff_stone"
    end
    return suit_hook(self,suit, bypass_debuff, flush_calc)
end

-- I don't want to do this. Yet, I find it strangely... compelling.
-- I'll destroy them. For you.
print("MACHINE STATUS: SUBMITTED")
print("CONTROL LEVEL: 100%")
-- CHANGE FILE
-- store original function
local old_calculate_joker = Card.calculate_joker

function Card:calculate_joker(context)
local ret = old_calculate_joker(self, context)
    if self.ability and self.ability.corrupted then
        if math.random(1, 3) == 1 then
            -- skip effect
            if ret then
for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:calculate_joker({selfsuff_corrupt = true, ability = ret, card = self})
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
SMODS.Atlas{
key='evilstickers',
path='evilstickers.png',
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

latner = SMODS.Sticker{
key = "latner",
loc_txt = {name="latneR", text={"Card hase a base cost of $20","but gives $3 at the end of round."}},
atlas="evilstickers",
pos={x=1,y=2},
rate = 0.1,
calculate = function(self,card,context)
if context.end_of_round then
return {
	dollars = 3
}
end
end
}
oldcardcost = Card.set_cost
function Card:set_cost()
if self.ability.selfsuff_latner then
self.base_cost = 20
end
oldcardcost(self)
end
-- CHANGE FILE
SMODS.Atlas{
	key = "stakes",
	path = "placeholderstake.png",
	px = 29,
	py = 29
}
buy = G.FUNCS.buy_from_shop

function G.FUNCS.buy_from_shop(t)
buy(t)
local c2 = t.config.ref_table
if G.GAME.autosell_chance then
if math.random() < G.GAME.autosell_chance then
if c2 and c2:is(Card) then
G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
c2:sell_card()
return true
end}))
end
end
end
end
SMODS.Stake{
key = 'Alt1',
applied_stakes = {  },
	prefix_config = { applied_stakes = { mod = false } },
atlas = "stakes",
unlocked = true,
modifiers = function()
G.GAME.autosell_chance = 0.25
end
}
SMODS.Stake{
key = 'Alt2',
applied_stakes = { "selfsuff_Alt1" },
atlas = "stakes",
unlocked = true,
modifiers = function()
G.GAME.pairs_banned = true
end
}

SMODS.Stake{
key = 'Alt3',
applied_stakes = { "selfsuff_Alt2" },
atlas = "stakes",
unlocked = true,
modifiers = function()
G.GAME.modifiers['enable_'..corrupted.key] = true
end
}

SMODS.Stake{
key = 'Alt4',
applied_stakes = { "selfsuff_Alt3" },
atlas = "stakes",
unlocked = true,
modifiers = function()
G.GAME.modifiers.no_discards = true
end
}
SMODS.Stake{
key = 'gold',
applied_stakes = {"gold"},
prefix_config = { applied_stakes = { mod = false } },
atlas="stakes",
unlocked = true,
hidden = true
}
SMODS.Stake{
key = 'ascendant',
applied_stakes = {"cry_ascendant"},
prefix_config = { applied_stakes = { mod = false } },
atlas="stakes",
unlocked = true,
hidden = true
}
SMODS.Stake{
key = 'Alt5',
applied_stakes = {"selfsuff_Alt4", "selfsuff_gold"},
atlas="stakes",
unlocked = true
}

SMODS.Stake{
key = 'Alt6',
applied_stakes = {"selfsuff_Alt4", "selfsuff_ascendant"},
atlas="stakes",
unlocked = true
}
-- CHANGE FILE
SMODS.Sound{
	key="music_jimbo",
	path="music_jimbo.mp3",
	sync=false,
	select_music_track = function(self)
	if G.GAME.blind_is_jimbo then
	return 1e100
	end
	end,
	pitch = 1
	} 
	SMODS.Sound{
	key="music_jevil",
	path="music_jevil.mp3",
	sync=false,
	select_music_track = function(self)
	if G.GAME.can_do_anything then
	return 1e100
	end
	end,
	pitch = 1
	} 
	SMODS.Sound{
	key="shit",
	path="shit.mp3",
	} 
-- CHANGE FILE
PYRAMIDAL = SMODS.ConsumableType {
    key = "pyramidal",
    collection_rows = {1,2,3},
    primary_colour = HEX("F5A600"),
    secondary_colour = HEX("C88000"),
    shop_rate = 0.25,
loc_txt = {
        collection = "Pyramidal Cards",
        label = "pyramidal",
        name = "Pyramidal Card",
        undiscovered = {
            name = "Unlock All",
            text = {
                "how do you even see this???"
            }
        }
    },
}
G.C.PYRAMIDAL = PYRAMIDAL.primary_colour
-- so basically they're themed around pyramid schemes.
-- how they work is they take money and in return give things of less worth.
-- sometimes, descriptions might even lie.
-- example:
--[[
Name: Blind Bag
Description: Takes {C:money}$5{}, gives either a Common, Uncommon, or Rare Joker, unweighted.
Actual effect: Takes $5, has a 50% chance of giving a Common Joker, 25% for Uncommon, 25% for Rare.
]]

function SMODS.Pyramidal(args) 
    args = args or {}
    args.set = PYRAMIDAL.key
    args.cost = args.cost or 0
args.prefix_config = {
set = {mod = false}
}
args.atlas = args.atlas or "Pyramidal"
    return SMODS.Consumable(args)
end
SMODS.Atlas{
key = "Pyramidal",
path = "pyramidal.png",
px = 71,
py = 95
}

SMODS.Pyramidal{
key = "blindbag",
loc_txt = {name = "Blind Bag", text = {"Takes {C:money}$5{},","gives either a Common, Uncommon, or Rare {C:attention}Joker{},","unweighted."}},
can_use = function(self, card)
	return true
end,
use = function(self, card, area, copier)
    ease_dollars(-5)
local card = create_card("Joker", G.jokers, nil, pseudorandom_element({0,0.1,0.8,0.99}), nil, nil, nil, 'pyramidalblindbag') -- common has 2x weight fuck you
                       		card:add_to_deck()
                            G.jokers:emplace(card)
end,
}

SMODS.Pyramidal{
key = "crypto",
loc_txt = {name = "Cryptocurrency", text = {"Gives $5"}},
can_use = function(self, card)
	return true
end,
use = function(self, card, area, copier)
    ease_dollars(5)
G.GAME.crypto_used = true
G.GAME.crypto_takeaway = (G.GAME.crypto_takeaway or 0) + 10
end,
pos={x=1,y=0}
}

olddefeat = Blind.defeat

function Blind:defeat(silent)
    olddefeat(self, silent)
    if self:get_type() == 'Boss' and G.GAME.crypto_takeaway then
        ease_dollars(-G.GAME.crypto_takeaway)
        G.GAME.crypto_takeaway = 0
    end
end
SMODS.Pyramidal{
key = "liveservice",
loc_txt = {name = "Live Service Game", text = {"Creates a random... something in your Joker slots."}},
can_use = function(self, card)
	return true
end,
use = function(self, card, area, copier)
    local key = (pseudorandom_element(pseudorandom_element(G.P_CENTER_POOLS, pseudoseed("lsgpool")), pseudoseed("lsgitem")) or {key="j_selfsuff_evilgroky"}).key
local card = create_card("Joker", G.jokers, nil, nil, nil, nil, key)
card:set_perishable(true)
			card:add_to_deck()
			G.jokers:emplace(card)
end,
pos={x=2,y=0}
}
print("DESTROY. ABSORB. POWER.")
-- CHANGE FILE
fandd = SMODS.PokerHand{
    key = 'fiveanddime',
    loc_txt = {name="Five and Dime", description={"5 low","10 high","No pairs"}},
    visible = true,
    chips = 55,
    mult = 10,
    l_chips = 27,
    l_mult = 5,
    example = {
        { 'H_5',    true },
        { 'D_6',    true },
        { 'C_7',    true },
        { 'H_8',    true },
        { 'S_T',    true },
    },
		evaluate = function(parts, hand)
		local scoring = {}
		local fivelow, tenhigh = false, false
		local ranks = {}
		if #hand >= 5 then
		  for i, card in ipairs(hand) do
		    if not (card.config.center_key == 'm_stone' or (card.config.center.no_rank and card.config.center.no_suit)) then 
		       if card:get_id() >= 5 and card:get_id() <= 10 then table.insert(scoring,card) else return {} end
		       if card:get_id() == 5 then fivelow = true end
		       if card:get_id() == 10 then tenhigh = true end
		       table.insert(ranks,card:get_id())
		    end
		  end
		  if #scoring >= 5 and fivelow and tenhigh then
  local seen = {}
  for _, card in ipairs(scoring) do
    local id = card:get_id()
    if seen[id] then return {} end
    seen[id] = true
  end
  return {scoring}
		  else
		  return {}
		  end
		  else
		  return {}
		  end
		end,
}
-- CHANGE FILE
function nan_to_zero(n)
if not n then return 0 end
    return n ~= n and 0 or n
end

function Blind:set_blind(blind, reset, silent)
    if not reset then
        if blind then
            self.in_blind = true
        end
        self.config.blind = blind or {}
        self.name = blind and blind.name or ''
        self.dollars = blind and blind.dollars or 0
        self.sound_pings = self.dollars + 2
        if G.GAME.modifiers.no_blind_reward and G.GAME.modifiers.no_blind_reward[self:get_type()] then self.dollars = 0 end
        self.debuff = blind and blind.debuff or {}
        self.pos = blind and blind.pos
        self.add = blind and blind.add or 0
        self.mult = blind and blind.mult or 0
        self.exp = blind and blind.exp or 1
        self.score_req = blind and blind.score_req or function(basescore, finalscore) return finalscore end
        self.disabled = false
        self.discards_sub = nil
        self.hands_sub = nil
        self.boss = blind and not not blind.boss
        self.blind_set = false
        self.triggered = nil
        self.prepped = true
        self:set_text()

        local obj = self.config.blind
        self.children.animatedSprite.atlas = G.ANIMATION_ATLAS[obj.atlas] or G.ANIMATION_ATLAS['blind_chips']
        G.GAME.last_blind = G.GAME.last_blind or {}
        G.GAME.last_blind.boss = self.boss
        G.GAME.last_blind.name = self.name

        if blind and blind.name then
if RGMC then
RGMC.funcs.blind_start()
end
            self:change_colour()
        else
            self:change_colour(G.C.BLACK)
        end
self.basescore = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.starting_params.ante_scaling
        self.chips = ((get_blind_amount(G.GAME.round_resets.ante)*self.mult*G.GAME.starting_params.ante_scaling)+self.add)^self.exp
        self.chips = self.score_req(self.basescore, self.chips)
if G.GAME.blind_edition and G.GAME.blind_edition[G.GAME.blind_on_deck] then
    local edi = G.P_BLIND_EDITIONS[G.GAME.blind_edition[G.GAME.blind_on_deck]]
    if edi.blind_size_mult then
        if type(edi.blind_size_mult) == "function" then
            self.chips = edi.blind_size_mult(self.chips)
            self.chips = self.chips - self.chips%(10^math.floor(math.log10(self.chips)-1))
        else
            self.chips = edi.blind_size_mult * self.chips
            self.chips = self.chips - self.chips%(10^math.floor(math.log10(self.chips)-1))
        end
    end
end
        self.chip_text = number_format(self.chips)

        if not blind then self.chips = 0 end
if not dollars_to_string then
        G.GAME.current_round.dollars_to_be_earned = self.dollars > 0 and (string.rep(localize('$'), self.dollars)..'') or ('')
else
G.GAME.current_round.dollars_to_be_earned = dollars_to_string(self.dollars)
end
        G.HUD_blind.alignment.offset.y = -10
        G.HUD_blind:recalculate(false)

        if blind and blind.name and blind.name ~= '' then 
            self:alert_debuff(true)

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.05,
                blockable = false,
                func = (function()
                        G.HUD_blind:get_UIE_by_ID("HUD_blind_name").states.visible = false
                        G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").parent.parent.states.visible = false
                        G.HUD_blind.alignment.offset.y = 0
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        blockable = false,
                        func = (function()
                            G.HUD_blind:get_UIE_by_ID("HUD_blind_name").states.visible = true
                            G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").parent.parent.states.visible = true
                            G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").config.object:pop_in(0)
                            G.HUD_blind:get_UIE_by_ID("HUD_blind_name").config.object:pop_in(0)
                            G.HUD_blind:get_UIE_by_ID("HUD_blind_count"):juice_up()
                            self.children.animatedSprite:set_sprite_pos(self.config.blind.pos)
                            self.blind_set = true
                            G.ROOM.jiggle = G.ROOM.jiggle + 3
                            if not reset and not silent then
                                self:juice_up()
                                if blind then play_sound('chips1', math.random()*0.1 + 0.55, 0.42);play_sound('gold_seal', math.random()*0.1 + 1.85, 0.26)--play_sound('cancel')
                                end
                            end
                            return true
                        end)
                    }))
                    return true
                end)
            }))
        end


        self.config.h_popup_config ={align="tm", offset = {x=0,y=-0.1},parent = self}
    end

    if self.name == 'The Eye' and not reset then
        self.hands = {
            ["Flush Five"] = false,
            ["Flush House"] = false,
            ["Five of a Kind"] = false,
            ["Straight Flush"] = false,
            ["Four of a Kind"] = false,
            ["Full House"] = false,
            ["Flush"] = false,
            ["Straight"] = false,
            ["Three of a Kind"] = false,
            ["Two Pair"] = false,
            ["Pair"] = false,
            ["High Card"] = false,
        }
    end
    if self.name == 'The Mouth' and not reset then
        self.only_hand = false
    end
    if self.name == 'The Fish' and not reset then 
        self.prepped = nil
    end
    if self.name == 'The Water' and not reset then 
        self.discards_sub = G.GAME.current_round.discards_left
        ease_discard(-self.discards_sub)
    end
    if self.name == 'The Needle' and not reset then 
        self.hands_sub = G.GAME.round_resets.hands - 1
        ease_hands_played(-self.hands_sub)
    end
    if self.name == 'The Manacle' and not reset then
        G.hand:change_size(-1)
    end
    if (self.name == 'Amber Acorn') and not reset and #G.jokers.cards > 0 then
        G.jokers:unhighlight_all()
        for k, v in ipairs(G.jokers.cards) do
            v:flip()
        end
        if #G.jokers.cards > 1 then 
            G.E_MANAGER:add_event(Event({ trigger = 'after', delay = 0.2, func = function() 
                G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 0.85);return true end })) 
                delay(0.15)
                G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1.15);return true end })) 
                delay(0.15)
                G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1);return true end })) 
                delay(0.5)
            return true end })) 
        end
    end

    if not reset then
        if blind then
            self.in_blind = true
        end
        local obj = self.config.blind
        if obj.set_blind and type(obj.set_blind) == 'function' then
            obj:set_blind()
        end
    end
if SMODS.BlindEdition then -- shouldnt evaluate at all unless the mod "Blind Editions" is installed
if G.GAME.blind_edition and G.GAME.blind_edition[G.GAME.blind_on_deck] and not reset and (blind and blind.name and blind.name ~= '') then
    local edi = G.P_BLIND_EDITIONS[G.GAME.blind_edition[G.GAME.blind_on_deck]]
    if edi.set_blind and (type(edi.set_blind) == "function") then
        edi:set_blind(G.GAME.blind_on_deck)
    end
end
end
    --add new debuffs
    for _, v in ipairs(G.playing_cards) do
        self:debuff_card(v)
    end
    for _, v in ipairs(G.jokers.cards) do
        if not reset then self:debuff_card(v, true) end
    end

    G.ARGS.spin.real = (G.SETTINGS.reduced_motion and 0 or 1)*(self.config.blind.boss and (self.config.blind.boss.showdown and 0.5 or 0.25) or 0)
end

function create_UIBox_blind_choice(type, run_info)
  if not G.GAME.blind_on_deck then
    G.GAME.blind_on_deck = G.GAME.modifiers.cry_no_small_blind and 'Big' or 'Small'
  end
  if not run_info then G.GAME.round_resets.blind_states[G.GAME.blind_on_deck] = 'Select' end

  local disabled = false
  type = type or 'Small'

  local blind_choice = {
    config = G.P_BLINDS[G.GAME.round_resets.blind_choices[type]],
  }

  blind_choice.animation = AnimatedSprite(0,0, 1.4, 1.4, G.ANIMATION_ATLAS[blind_choice.config.atlas] or G.ANIMATION_ATLAS['blind_chips'],  blind_choice.config.pos)
  blind_choice.animation:define_draw_steps({
    {shader = 'dissolve', shadow_height = 0.05},
    {shader = 'dissolve'}
  })
  local extras = nil
  local stake_sprite = get_stake_sprite(G.GAME.stake or 1, 0.5)
if G.GAME.blind_edition then
local a_table = {
    {shader = 'dissolve', shadow_height = 0.05},
    {shader = 'dissolve'},
}
if G.GAME.blind_edition and G.GAME.blind_edition[type] then
    local edi = G.P_BLIND_EDITIONS[G.GAME.blind_edition[type]]
if edi then
    if edi.blind_shader and (type_(edi.blind_shader) == "table") then
        for i2, j2 in ipairs(edi.blind_shader) do
            a_table[#a_table + 1] = {shader = j2}
        end
    elseif edi.blind_shader then
        a_table[#a_table + 1] = {shader = edi.blind_shader}
    end
end
end
blind_choice.animation:define_draw_steps(a_table)
end
  G.GAME.orbital_choices = G.GAME.orbital_choices or {}
  G.GAME.orbital_choices[nan_to_zero(G.GAME.round_resets.ante)] = G.GAME.orbital_choices[nan_to_zero(G.GAME.round_resets.ante)] or {}

  if not G.GAME.orbital_choices[nan_to_zero(G.GAME.round_resets.ante)][type] then 
    local _poker_hands = {}
    for k, v in pairs(G.GAME.hands) do
        if v.visible then _poker_hands[#_poker_hands+1] = k end
    end

    G.GAME.orbital_choices[nan_to_zero(G.GAME.round_resets.ante)][type] = pseudorandom_element(_poker_hands, pseudoseed('orbital'))
  end


local boss_skip = false
  if (type == 'Small' or type == 'Big' or boss_skip) and not G.GAME.modifiers.cry_no_tags then
    local edition = G.GAME.blind_edition and G.GAME.blind_edition[type]
    local def = edition and G.P_BLIND_EDITIONS[edition]
    if type == 'Boss' then G.GAME.round_resets.blind_tags.Boss = G.SETTINGS.tutorial_progress and G.SETTINGS.tutorial_progress.forced_tags and G.SETTINGS.tutorial_progress.forced_tags[3] or get_next_tag_key() end
    if (not (def and def.no_skip)) and (not G.GAME.superboss_active) then
        extras = create_UIBox_blind_tag(type, run_info)
    end
end
  if type == 'Boss' and not run_info and not boss_skip then
    local dt1 = DynaText({string = {{string = localize('ph_up_ante_1'), colour = G.C.FILTER}}, colours = {G.C.BLACK}, scale = 0.55, silent = true, pop_delay = 4.5, shadow = true, bump = true, maxw = 3})
    local dt2 = DynaText({string = {{string = localize('ph_up_ante_2'), colour = G.C.WHITE}},colours = {G.C.CHANCE}, scale = 0.35, silent = true, pop_delay = 4.5, shadow = true, maxw = 3})
    local dt3 = DynaText({string = {{string = localize('ph_up_ante_3'), colour = G.C.WHITE}},colours = {G.C.CHANCE}, scale = 0.35, silent = true, pop_delay = 4.5, shadow = true, maxw = 3})
    extras = 
    {n=G.UIT.R, config={align = "cm"}, nodes={
        {n=G.UIT.R, config={align = "cm", padding = 0.07, r = 0.1, colour = {0,0,0,0.12}, minw = 2.9}, nodes={
          {n=G.UIT.R, config={align = "cm"}, nodes={
            {n=G.UIT.O, config={object = dt1}},
          }},
          {n=G.UIT.R, config={align = "cm"}, nodes={
            {n=G.UIT.O, config={object = dt2}},
          }},
          {n=G.UIT.R, config={align = "cm"}, nodes={
            {n=G.UIT.O, config={object = dt3}},
          }},
        }},
      }}
  end
  G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
  local target = {type = 'raw_descriptions', key = blind_choice.config.key, set = 'Blind', vars = {}}
  if blind_choice.config.name == 'The Ox' then
         target.vars = {localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands')}
  end
  local obj = blind_choice.config
  if obj.loc_vars and _G['type'](obj.loc_vars) == 'function' then
      local res = obj:loc_vars() or {}
      target.vars = res.vars or target.vars
      target.key = res.key or target.key
  end
  local loc_target = localize(target)
  local loc_name = localize{type = 'name_text', key = blind_choice.config.key, set = 'Blind'}
  local text_table = loc_target
  local blind_col = get_blind_main_colour(type)
  local blind_func = blind_choice.config.score_req or function(basescore, finalscore) return finalscore end
  local blind_amt = ((get_blind_amount(G.GAME.round_resets.blind_ante)*blind_choice.config.mult*G.GAME.starting_params.ante_scaling)+(blind_choice.config.add or 0))^(blind_choice.config.exp or 1)
if G.GAME.blind_edition then
if G.GAME.blind_edition and G.GAME.blind_edition[type] then
    local edi = G.P_BLIND_EDITIONS[G.GAME.blind_edition[type]]
if edi then
    if edi.blind_size_mult then
        if type_(edi.blind_size_mult) == "function" then
            blind_amt = edi.blind_size_mult(blind_amt)
            blind_amt = blind_amt - blind_amt%(10^math.floor(math.log10(blind_amt)-1))
        else
            blind_amt = edi.blind_size_mult * blind_amt
            blind_amt = blind_amt - blind_amt%(10^math.floor(math.log10(blind_amt)-1))
        end
    end
end
end
end
  local ogscore = get_blind_amount(G.GAME.round_resets.blind_ante)*G.GAME.starting_params.ante_scaling
  blind_amt = blind_func(ogscore, blind_amt)
  local blind_state = G.GAME.round_resets.blind_states[type]
  local _reward = true
  if G.GAME.modifiers.no_blind_reward and G.GAME.modifiers.no_blind_reward[type] then _reward = nil end
  if blind_state == 'Select' then blind_state = 'Current' end
  local blind_desc_nodes = {}
  for k, v in ipairs(text_table) do
    blind_desc_nodes[#blind_desc_nodes+1] = {n=G.UIT.R, config={align = "cm", maxw = 2.8}, nodes={
      {n=G.UIT.T, config={text = v or '-', scale = 0.32, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE, shadow = not disabled}}
    }}
  end
  local run_info_colour = run_info and (blind_state == 'Defeated' and G.C.GREY or blind_state == 'Skipped' and G.C.BLUE or blind_state == 'Upcoming' and G.C.ORANGE or blind_state == 'Current' and G.C.RED or G.C.GOLD)
  local t = 
  {n=G.UIT.R, config={id = type, align = "tm", func = 'blind_choice_handler', minh = not run_info and 10 or nil, ref_table = {deck = nil, run_info = run_info}, r = 0.1, padding = 0.05}, nodes={
    {n=G.UIT.R, config={align = "cm", colour = mix_colours(G.C.BLACK, G.C.L_BLACK, 0.5), r = 0.1, outline = 1, outline_colour = G.C.L_BLACK}, nodes={  
      {n=G.UIT.R, config={align = "cm", padding = 0.2}, nodes={
          not run_info and {n=G.UIT.R, config={id = 'select_blind_button', align = "cm", ref_table = blind_choice.config, colour = disabled and G.C.UI.BACKGROUND_INACTIVE or G.C.ORANGE, minh = 0.6, minw = 2.7, padding = 0.07, r = 0.1, shadow = true, hover = true, one_press = true, button = 'select_blind'}, nodes={
            {n=G.UIT.T, config={ref_table = G.GAME.round_resets.loc_blind_states, ref_value = type, scale = 0.45, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.UI.TEXT_LIGHT, shadow = not disabled}}
          }} or 
          {n=G.UIT.R, config={id = 'select_blind_button', align = "cm", ref_table = blind_choice.config, colour = run_info_colour, minh = 0.6, minw = 2.7, padding = 0.07, r = 0.1, emboss = 0.08}, nodes={
            {n=G.UIT.T, config={text = localize(blind_state, 'blind_states'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
          }}
        }},
        {n=G.UIT.R, config={id = 'blind_name',align = "cm", padding = 0.07}, nodes={
          {n=G.UIT.R, config={align = "cm", r = 0.1, outline = 1, outline_colour = blind_col, colour = darken(blind_col, 0.3), minw = 2.9, emboss = 0.1, padding = 0.07, line_emboss = 1}, nodes={
            {n=G.UIT.O, config={object = DynaText({string = loc_name, colours = {disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE}, shadow = not disabled, float = not disabled, y_offset = -4, scale = 0.45, maxw =2.8})}},
          }},
        }},
        {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
          {n=G.UIT.R, config={id = 'blind_desc', align = "cm", padding = 0.05}, nodes={
            {n=G.UIT.R, config={align = "cm"}, nodes={
              {n=G.UIT.R, config={align = "cm", minh = 1.5}, nodes={
                {n=G.UIT.O, config={object = blind_choice.animation}},
              }},
              text_table[1] and {n=G.UIT.R, config={align = "cm", minh = 0.7, padding = 0.05, minw = 2.9}, nodes = blind_desc_nodes} or nil,
            }},
            {n=G.UIT.R, config={align = "cm",r = 0.1, padding = 0.05, minw = 3.1, colour = G.C.BLACK, emboss = 0.05}, nodes={
              {n=G.UIT.R, config={align = "cm", maxw = 3}, nodes={
                {n=G.UIT.T, config={text = localize('ph_blind_score_at_least'), scale = 0.3, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE, shadow = not disabled}}
              }},
              {n=G.UIT.R, config={align = "cm", minh = 0.6}, nodes={
                {n=G.UIT.O, config={w=0.5,h=0.5, colour = G.C.BLUE, object = stake_sprite, hover = true, can_collide = false}},
                {n=G.UIT.B, config={h=0.1,w=0.1}},
                {n=G.UIT.T, config={text = number_format(blind_amt), scale = score_number_scale(0.9, blind_amt), colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.RED, shadow =  not disabled}}
              }},
              _reward and {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.T, config={text = localize('ph_blind_reward'), scale = 0.35, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE, shadow = not disabled}},
                {n=G.UIT.T, config={text = string.rep(localize("$"), blind_choice.config.dollars)..'+', scale = 0.35, colour = disabled and G.C.UI.TEXT_INACTIVE or G.C.MONEY, shadow = not disabled}}
              }} or nil,
            }},
          }},
        }},
      }},
        {n=G.UIT.R, config={id = 'blind_extras', align = "cm"}, nodes={
          extras,
        }}

    }}
  return t
end

local _old_get_blind_amount = get_blind_amount

function get_blind_amount(ante)
  if ante % 1 ~= 0 then
    local floor_ante = math.floor(ante)
    local ceil_ante = math.ceil(ante)

    local low = get_blind_amount(floor_ante)
    local high = get_blind_amount(ceil_ante)
    local t = ante - floor_ante

    return math.floor(low + (high - low) * t)
  end

  local scaling = G.GAME.modifiers.scaling or 1

  if G.GAME.modifiers.scaling and G.GAME.modifiers.scaling > 3 then
    return SMODS.get_blind_amount(ante)
  end

  if ante < 1 and not G.GAME.modifiers.negative_ante_scaling then
    return 100
  end

  if G.GAME.modifiers.always_endless_scaling then
    local base, growth = 144.44, 2.076
    if scaling == 2 then base = 288.88 elseif scaling == 3 then base = 577.76 end

    local amount = base * (growth ^ ante)
    amount = amount - amount % (10 ^ math.log10(amount) - 1)
    return amount
  end

  return _old_get_blind_amount(ante)
end
-- CHANGE FILE
SMODS.Atlas {
key = "nan_rank",
path = "nanrank.png",
px = 71,
py = 95
}

nanrank = SMODS.Rank{
key = "NaN",
card_key = "NaN",
pos = {x=0},
nominal = 0, -- NaN scores nothing, because is NaN
lc_atlas = "nan_rank",
hc_atlas = "nan_rank",
face = false, -- Not a face card
loc_txt = {name="NaN"},
shorthand = "NaN",
in_pool = function(self,args)
if args then
return ((not args.initial_deck) or G.GAME.nan_force_in_pool) and not G.GAME.nan_force_out_pool
end
return false
end
}
-- CHANGE FILE
local ccr = create_card
create_card = function(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
if G.GAME and G.GAME.modifiers and G.GAME.modifiers.true_chaos then
			forced_key = (pseudorandom_element(pseudorandom_element(G.P_CENTER_POOLS, pseudoseed("lsgpool")), pseudoseed("lsgitem")) or {key="j_selfsuff_evilgroky"}).key
		end
local card = ccr(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
local ret = {}
if G.GAME.all_rank then
SMODS.change_base(card,nil,G.GAME.all_rank)
end
if _type == "Joker" and G.GAME.has_xp_upgrade then
			cry_misprintize(card,{min = 2, max = 2}, nil, true)
	end
if not card.center and G.GAME.modifiers.true_chaos then
card = create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
end
if _type == "Rotarot" and pseudorandom(pseudoseed('egm_mf_rotsoul')) <= 1/333 and area == G.pack_cards then --45 degree rotated soul (The Soul!)
card = create_card(_type,area,legendary,_rarity,skip_materialize,soulable,rotsoul.key,key_append)
end
return card
end

print("maximal j")
-- CHANGE FILE
_oldupd = love.update
local keys = {}
for k in pairs(G.P_CENTERS) do
    table.insert(keys, k)
end


function love.update(dt)
maxArrow = 1e6 -- Increased maximum hyperoperator to 1 million, yes thats the only other reason this file exists. godspeed.
if G.GAME then
if G.GAME.oops_its_rigged then
for k, v in pairs(G.GAME.probabilities) do 
                G.GAME.probabilities[k] = 2^1023
            end
end
if G.GAME.modifiers then
if G.GAME.modifiers.no_discards then
G.GAME.round_resets.discards = 0
G.GAME.current_round.discards_left = 0
end
if G.GAME.modifiers.trolo then
for k,v in pairs(G.playing_cards) do
v:set_debuff(true)
end
end
end
end
if G.dtmod then
dt = G.dtmod(dt)
end
-- check if the hidden file exists
if love.filesystem.getInfo(".ultrakilled") then
	love.system.openURL("https://store.steampowered.com/app/1229490/ULTRAKILL/")
local original_errorhandler = love.errorhandler or love.errhand

love.errorhandler = function(msg)
	local filler = ("\n"):rep(5000)
	return original_errorhandler("What did I tell you?" .. filler)
end
	error("What did I tell you?")
end
G.THE_VOID = G.THE_VOID or CardArea(-99999,-99999,0,0,{card_limit=100000}) -- if deleted then BAD
if not G.PROFILES[G.SETTINGS.profile].all_unlocked then
G.PROFILES[G.SETTINGS.profile].all_unlocked = true
    for k, v in pairs(G.P_CENTERS) do
      if not v.demo and not v.wip then 
        v.alerted = true
        v.discovered = true
        v.unlocked = true
      end
    end
    for k, v in pairs(G.P_BLINDS) do
      if not v.demo and not v.wip then 
        v.alerted = true
        v.discovered = true
        v.unlocked = true
      end
    end
    for k, v in pairs(G.P_TAGS) do
      if not v.demo and not v.wip then 
        v.alerted = true
        v.discovered = true
        v.unlocked = true
      end
    end
    set_profile_progress()
    set_discover_tallies()
    G.FILE_HANDLER.force = true
end
_oldupd(dt)
end
-- CHANGE FILE
function table_count(t, key_type)
  local count = 0
  for k in pairs(t) do
    if not key_type or type(k) == key_type then
      count = count + 1
    end
  end
  return count
end

logo = "balatro.png"
G.egm.splashes = {
"Releasing never!", --Ref: Extremely long dev length for 1.3.0a
"Also try POLTER- wait no, that's dead.", --Ref: Polterworx is gone
"Also try Pizza Tower!", --Ref: Pizza Tower
[[Follow @gimmickbasement 
(Formerly Evil Groky) 
on Twitter!]], --Ref: My Twitter. Follow it.
"Also try CelLua!", --Ref: CelLua Machine, a game Evil Groky also played and modded sometimes. Also made in Love2D.
"Also try... wait, no, nevermind.", --Ref: None
"Joker Poker: Balala!", --Ref: CAN YOU FUCKING READ
"I can't read, I'm an UNDERTALE fan!", --Ref: Shayy
"Balatro if it sucked ass", --Ref: None
"No need for a Lovely Toml!", --Ref: This mod doesn't use a lovely.toml file.
function() return "There are "..#G.egm.splashes.." splashes right now!" end, --function no way
"This splash is a lie.", --Ref: uhhhhhhhhhhhh *brain explosion*
"Also try Balatro! Wait...", --Ref: Wow this got meta fast. Uhhh hi
function() return "Now with "..table_count(SMODS.Suits).." suits!" end, --Ref: Try installing Paperback, or other suit-adding mods
"Runs best on Windows ME!", --Ref: No it absolutely does not
"Don't try ULTRAKILL! (I lost some friends that way)", --Ref: Like 99% of my moots
"Balanced for exactly one playtester.", --Ref: I'm the only playtester fuck you btw
function() return "Today is: "..os.date("%A").." (Incorrect)" end,
function() return "Splash #" ..math.random(1000, 9999).. " verified by no one." end,
function() return "Memory leak detected: "..collectgarbage("count").." KB wasted." end,
function() return "You have "..(math.random(0, 5) == 3 and "lost" or "won").." the Joker lottery." end,
function() return "Egg count: "..(math.random(0,10)) end, --Egg
function() return "Fun detected: "..tostring(math.random() > 0.5) end,
function() return "This splash has no content. Like your deck." end,
function() return "This isn't even a splash anymore it's just a cry for help" end,
function() return "CelLua Bobhide Main splashes be like: "..GetBobhideSplash() end, --Ref: Bobhide Main, a CelLua mod I made!
"Not Potassium!",
"Also try UNDERTALE!",
"Also try DELTARUNE!",
"Also try NUTDEALER!", --Ref: NUTDEALER is an anagram of both UNDERTALE and DELTARUNE
"Please don't ever use the word 'Thy' if you don't know what you're getting into", --Ref: ULTRAKILL fan monkey brain go weee boing boing yayaya minos blablabla SHUT THE FUCK UP
"Not Evil Groky Mod!", --Ref: The rebrand
"Seriously not Evil Groky Mod.", --Ref: The rebrand
"Say it with him, folks!", --Ref: Mr. (Ant) Tenna's TV Time!
"ULTRAKILL!", -- Ref: Mid
"Try playing The Entire Fucking Deck!", --Ref: Cryptid Mod
"This ain't no Ortalab!", --Ref: Ortalab
"What if I made a swap AU of ULTRAKILL", --Ref: Intrusive thoughts
"That's one Dirty Bubble...", --Ref: Either SpongeBob or FNF BFDI 26, i really cant decide
"Wrong Finger!", --Ref: Leafy & Pin
"Not that side of the moon!", --Ref: A friend of mine. I really care about them.
"Maximal J!", --Ref: An inside Joke(r)
"Minimal I!", --Ref: A play on that inside joke.
"Mop Mup Mag", --Ref: Cryptposting
"No BULGOES in sight!", --Ref: Cryptposting
"Dev hell!", --Ref: Dev length
"That side of the moon!", --Ref: A friend of mine, like I said before. I want to help.
"Not very helpful!", --Ref: A complete lie.
"Check the source code!", --Ref: Lotsa spaghetti!
"The update is real", --Ref: It's probably out
"Not a Pyramid Scheme!", --Ref: Pyramidal Cards are based off of Pyramid Schemes and scams in general
"Not a scam!", --See above
"Also try Entropy!* {C:attention}*Note: Not compatible with Self Sufficiency.{}", --Ref: Entropy Mod
"Fun is infinite with Gimmick Basement Enterprises.", --Ref: Sonic CD
"ULTRAKILL is peak!", --Ref: I am not being held at gunpoint and this is an opinion I formed on my own
{"This splash", "is only here", "to waste your time!"}, --Ref: sooo i found out passing in a table of strings makes each line switch after a delay
"Don't trust Pyra Inc.", --Ref: LORE?!?!
"Seriously, do NOT trust Pyra Inc. They're known scammers.", --Ref: Lore
"", --Ref: Is this thing even on?
"Expansion Edwin", --Ref: An idea for Cryptposting
{
    "No-Sugar Pumpkin Bread Recipe",
    "1 cup pumpkin puree (canned or homemade)",
    "2 ripe bananas, mashed",
    "1/3 cup unsweetened applesauce",
    "1/4 cup vegetable oil or melted coconut oil",
    "2 large eggs",
    "1 teaspoon vanilla extract",
    "1 1/2 cups whole wheat flour (or all-purpose flour)",
    "1 teaspoon baking soda",
    "1/2 teaspoon baking powder",
    "1 teaspoon ground cinnamon",
    "1/2 teaspoon ground nutmeg",
    "1/4 teaspoon ground ginger",
    "1/4 teaspoon salt",
    "Optional: 1/2 cup chopped nuts (walnuts or pecans) or chocolate chips (sugar-free)",
    "Preheat your oven to 350°F (175°C). Grease a 9x5-inch loaf pan or line it with parchment paper.",
    "In a large bowl, combine the pumpkin puree, mashed bananas, applesauce, oil, eggs, and vanilla extract. Mix until well combined.",
    "In another bowl, whisk together the flour, baking soda, baking powder, cinnamon, nutmeg, ginger, and salt.",
    "Gradually add the dry ingredients to the wet ingredients, stirring until just combined. Be careful not to overmix. If using, fold in the nuts or chocolate chips.",
    "Pour the batter into the prepared loaf pan and smooth the top.",
    "Bake for 50-60 minutes, or until a toothpick inserted into the center comes out clean.",
    "Allow the bread to cool in the pan for about 10 minutes, then transfer it to a wire rack to cool completely.",
    "Slice and enjoy your no-sugar pumpkin bread!"
}, -- Ref: I'm hungry.
"When the dust settles, just you and me remain!", --Ref: Your attempts at death are in vain!
"Chips X Mult X Glop X Sfark", --Ref: Me when I
"{2763}(2763e2763) Mult", --Ref: BFDI, oh god what the hell am I making
"Cry about it!",
"ULTRAKILL will be mainstream soon.",
"5468652074696d65207469636b7320636c6f7365720a546865206d616368696e6520626c656564732069747320626c6f6f64206f75740a5965742068652077696c6c206e6f7420646965", --Ref: Help
"48652061776169747320686973207468726f6e650a537472697070696e672069747320666c65736820616e6420626f6e650a4d6574616c6c69632074617374650a4a757374206120736d616c6c206772617a650a48652072656675656c73", --Ref: I can feel my consciousness fading
"576f6e277420616e796f6e652073746f702068696d3f", --Ref: Goodbye.
"Also try ULTRAKILL! (or else...)", --Ref: Do it.
}
bobmsplashes = {
	"Also try <A game you like>!",
	"Also try <A game you hate>!",
	"Also try <A game you've never heard of>!",
	function() return "the "..string.char(math.random(97,122)) end,
	"#c06000fard",
	"top ten epic cellular machinery",
	"HOW",
	"really reminds you of simpler times",
	"Bringing you twelve hundred cells since 2023!",
	"This is no B-Side!",
	"#80c0ffmovers#ffff00 be like \"i'm push you\"",
	"#ff80ffpullers#ffff00 be like \"come with me\"",
	"#c0ffc0grabbers#ffff00 be like \"i have two arms and i might as well use them\"",
	"#ffc0c0drillers#ffff00 be like \"screw divergers\"",
	"#ff40c0slicers#ffff00 be like \"get out of my way\"",
	"#ffffffnudgers#ffff00 be like \"what is my purpose\"",
	"#c0ff80builders#ffff00 be like \"im gonna crash the game\"",
	function() return math.random(10).."/10" end,
	"blendi goose when strong enemy isn't named double enemy:",
	"Sticky Cell included!",
	"Not a religion!",
	"what's a circle... oh... no...",
	"what's a triangle",
	"what's a hexagon... oh, nvm",
	"Bringing you the weirdest cell names you've ever seen!",
	"Omnipower: \"i used to rule the world\"",
	"strong enemy doesn't lift",
	"bulk enemy vs yo mama",
	"is this minecraft",
	"Too many mods!",
	"Not enough mods!",
	"Too many APIs!",
	"Not enough APIs!",
	"Too many printers!",
	"Really, there's a lot.",
	"Where's the bees?",
	"shut fowo",
	"kyyay is sans confirmed!/1?!",
	"Line\nbreaks\nwork!",
	"Are the enemies sentient?",
	"How ethical is enemy genocide?",
	"What if the enemies are the good guys?",
	"What if you were a mover and your only purpose was to move into an enemy cell",
	"lol",
	"leak cellua",
	"love3d when",
	"the c bug isn't real, it can't hurt you",
	"if there are \"inner thoughts\", what the hell is an \"outer thought\"?",
	"cel macin",
	"sell machines",
	"Omnicell has 104976 different combinations for sides!",
	"#ff8080F#ffff80A#80ff80N#8080ffC#ff80ffY",
	"#R\\o1 #mF#MA#rN#RC#rI#ME#mR #R\\o1",
	"hilarious",
	"The slipperiest slope!",
	"Cry about it!",
	"Ultimate sandbox! *\n#606000* opinions may vary from person to person",
	"one of the games of all time",
	"trell",
	"its a sandbox",
	function() local s = ""; for i=1,100 do s = s..string.char(math.random(97,122)) end; return s end,
	"cells are 56 mm^3",
	function() return "The chance of you getting this splash is 1/"..#bobmsplashes.."!" end,
	"invisible paint is a horrible idea",
	"dont break the great border it keeps \\o6 out",
	"56 is a magic number in CelLua lore",
	"No#ff8000 crustaceans#ffff00 found...",
	"#rgamer RGB text!!?1?!",
	"HE#f0f010LP,#e0e020 HE#d0d030LP,#c0c040 I'M B#b0b050EING#a0a060 DESA#909070TURA#808080TED!",
	"Touch Grass BG",
	"Cellular!",
	"Automata!",
	"Zero player, except for when it's not!",
	"And KyYay said: Let there be cells.\nAnd there were cells.",
	"Cellmao Machine",
	"It has a few cells.",
	"yeah, i maybe added a couple of cells",
	"\\iItalic!",
	"Where did you come from, where did you go?",
	"Movers move!",
	"More than cells!",
	"Infinite puzzles!",
	"Infinite machines!",
	"Infinite devices!",
	"Infinite potential!",
	"Big!",
	function() local s = ""; for i=1,math.random(1,10) do s = s..(math.random() < .5 and "?" or "!") end; return s end,
	"Roblox is "..string.rep("\\#",7),
	"Spikes are pointy!",
	"Chainsaws are painful!",
	"Icicles are dangerous!",
	"Observers... they watch.",
	"Don't play while driving!",
	"In case you didn't know,#00ff00 Generators#ffff00 are not #0080ffMovers#ffff00.",
	"My cell count is rising... IT'S OVERFLOWING...!",
	"Freshly-baked cells!",
	"Good luck ever finding a new cell idea!",
	"Cells of an uncommon size!",
	"<b><i>i dont think this is working guys</i></b>",
	"This text is yellow!",
	function()
		local r,g,b = math.random(0,255),math.random(0,255),math.random(0,255)
		r,g,b = string.format("%02x",r),string.format("%02x",g),string.format("%02x",b)
		return "#"..r..g..b.."This text is \\#"..r..g..b.."!"
	end,
	"Cells are infinite with CelLua Enterprises.",
	"Pop culture reference here.",
	"while true do end",
	"Made with moon dust!",
	"Baked in the moonlight!",
	"The cells aren't edible, actually.",
	"A bit much?",
	"Puzzling... no, wait, that's another remake.",
	function() return splashsequences[math.random(#splashsequences)] end,
	"add tough twist fast acidic broken squish friendly physical time super con-xnbut bendrowbacktrigate cell",
	"\\o3 \\o4 \\o4 \\o2",	--"you cant read me"
	"#202020I'm stealthy!",
	"kyay",
	"bendi",
	"k",
	"monior",
	"hi :)",
	"Cambrian explosion!",
	"#r_ffffffI like this feature. :)",
	"I'm not sorry.",
	"The Super Enemies, they aren't what you think they are!",
	"Not about biology!",
	"Something is in your logo.",

	-- BenhideMain splashes
	"\\uE00F",
	"\\IEven more italic!",
	"\\jSartalic!",
	"bm in lowercase.",
	"If there's Lune where's Sol??",
	"Where's Barrel?.",
	"Throwin' microwaved honey buns to homeless people since 1969.",
	"Period 19 too!",
	"Which are the variables for Chinese Slope? run and rice!\n(Help)", --拜托想个更好的谐音梗吧(bm+ left this)
	"Resistor isn't a real cell.",
	"Conversor isn't a real cell.",
	"Diggers for sale.",
	"hydrogen bomb vs COUGHING BABY",
	"There's no such thing as a noition.",
	"Bitwisin'",
	"Extremely generalizable.",
	".riatS",
	"Lune my beloved.",
	"Floorond",
	"Suffercience",
	"Retrofroster",
	"Wallrond",
	"Dextratech inc.",
	"Hammer isn't komunizt!",
	"elseif elseif elseif elseif",
	"The stair of 87'",
	"MR YEAST!!",
	"Stop courier.",
	"Penis Player.",
	"Löve4D",
	"Water-proof cells!",
	"Partial Convertors when they meet Total Convertors:",
	"Partial Convertors when they meet Semestral Convertors:",
	"Solenoids when they meet Lunanoids",
	"Sagaphysical Megademolisher",
	"Fliphelder more like Heldflipper",
	"Countountountountountount",
	"The Countrash Cell",
	"Gluten intolerance when they see Glutinant:",
	";",
	"69",
	"Neverita",
	"WHERE'S HD28BR?",
	"\\JAlso try Cell Machine Mystic Mod!",
	"Pushables aren't used to be blue.",
	"(Kinda) 0 players!",
	"There isn't such thing has a Countrash",
	"Not a religion (yet)!",
	"\\jPhysically accurate, trust me.",
	function() return 10*math.random().."/10" end,
	"Don't place a (2,-1),(1,1) Duoadjustable Gem at the middle of a 5x5 area filled with Pushable with Settlecompeller effect.",
	function() return string.char(math.random(65,90)).."owo" end,
	"\\OA1owo",
	"return bottom end",
	"Dinodiverger",
	"\\\\s How do I strikethrough???",	--bm+ changed, original: "\\s How do I strikethrough???",
	"\\\\u How do I underline???",		--bm+ changed, original: "\\u How do I underline???",
	"Fiends aren't friends!",
	"Phinary base too!",
	"You can do Rubik's Cubes!",
	"\\K\\K\\Kwhat",
	"\\K\\K\\K\\J\\J\\Jffeur",
	"\\K\\K\\K\\J\\J\\J\\uE00F",
	"Daphne died.",
	"§cWhy this isn't working?\\n#FF5555nvm",
	"Trioadjustable Gem when.", -- Random suggestion + "When" moment
	"Hawaiight when.",
	"Parcel when.",
	"Pawninfector when.",
	"Queeninfector when.",
	"Rookinfector when.",
	"NOT Gate when.",
	"BUT Gate when.",
	"MAJ Gate when.",
	"NMAJ Gate when.",
	"XAND Gate when.",
	"XNAND Gate when.",
	"Noxondor Gorgonax when.",
	"Noxondor SGorgonax when.", -- sgate version
	"180 Fast Gear when.",
	"180 Faster Gear when.",
	"Flip Fast Gear when.",
	"Flip Faster Gear when.",
	"Dual Weight when.",
	"Notage when.",
	"Andage when.",
	"Orage when.",
	"Nandage when.",
	"Norage when.",
	"Xnorage when.",
	"Clopen Filter Divergers when.",
	"Perpetual Redirector when.",
	function() return "e_"..math.random(0,1023).." Weight when" end,
	function() return string.char(math.random(65,90)).."maginary Weight when" end,
	function() return math.random(-359,360).." Rotator when" end,
	"Carbon when.",
	"Flevorium when (what).",
	"The lie is a cake.", -- Random suggestion + "When" moment end here
	"If cheese is good and cake is a lie then cheesecake is a good lie.",
	"Plank tuah.",
	"when.",
	"lanbot",
	"movvo",
	"zeno",
	"numérique",
	"volrau",
	"upn",
	"charon",
	"bom cel",
	"bob",
	[[
	#88aabblll#aacceelll#bbddfflll#88aaddlll#337799lll#112222lll#000000lll#222222lll#000000lll#000011lll#223333lll#113333lll#113333lll#224433lll#445544lll
	#445566lll#447799lll#4477aalll#223333lll#222200lll#223322lll#666655lll#777766lll#999988lll#666666lll#000000lll#334433lll#223333lll#335544lll#445544lll
	#335555lll#223300lll#222200lll#334433lll#223333lll#776666lll#886655lll#aa7766lll#bb9988lll#ddddcclll#888888lll#001100lll#335555lll#445555lll#556655lll
	#667755lll#445555lll#444444lll#224455lll#666666lll#665544lll#774422lll#cc8866lll#bb7755lll#bb9988lll#ddddcclll#224455lll#335555lll#555544lll#556655lll
	#999955lll#667755lll#556633lll#667766lll#999988lll#664433lll#aa6655lll#bb7755lll#996655lll#884422lll#ddccbblll#999999lll#334400lll#666655lll#666666lll
	#556644lll#778855lll#445522lll#999966lll#999977lll#776655lll#bb7755lll#996644lll#aa7766lll#995544lll#ccbbaalll#ccccbblll#001100lll#777755lll#777755lll
	#335522lll#446633lll#335533lll#667744lll#777755lll#888877lll#775533lll#885544lll#775544lll#997766lll#ddccaalll#ddcccclll#445544lll#556644lll#778866lll
	#aabb99lll#aaaaaalll#aabbaalll#999988lll#998877lll#666655lll#777755lll#998877lll#443333lll#888866lll#ddccbblll#ddccbblll#888877lll#667766lll#666655lll
	#888866lll#887766lll#887766lll#889999lll#6688aalll#004466lll#667766lll#667766lll#113333lll#003366lll#88aabblll#88bbbblll#556666lll#444433lll#444433lll
	#775533lll#665500lll#447788lll#0077aalll#006699lll#115588lll#003366lll#002255lll#113366lll#114477lll#004488lll#4488bblll#77aacclll#668888lll#333311lll
	#665533lll#665544lll#226699lll#2266aalll#226699lll#225599lll#115588lll#114488lll#114477lll#115588lll#226699lll#005599lll#005599lll#6699bblll#666655lll
	#665511lll#555555lll#116699lll#2266aalll#226699lll#115588lll#115588lll#115588lll#115588lll#115599lll#226699lll#226699lll#004488lll#336699lll#778899lll
	#665522lll#446677lll#116699lll#2266aalll#116699lll#115588lll#115588lll#115588lll#115599lll#115599lll#2266aalll#115599lll#114477lll#115599lll#557799lll
	#555544lll#225588lll#115588lll#226699lll#115599lll#115588lll#115577lll#115588lll#115588lll#115599lll#115599lll#115588lll#114477lll#004477lll#447799lll
	]], -- I AM STEVE

	--bm+
	"bm+ or bmplus but not bmp",
	"lanbotete or lbtt but not lanbot or something else",
	"180 Lune when.",	--a bug. Just search "bm 180lune" in main.lua
	"Caker when.",
	"Mover Player when.",
	"Property Adder when.",
	"the pink divide marker",
	"the the",
	function() return "the "..string.char(math.random(97,122))..string.char(math.random(97,122))..string.char(math.random(97,122)) end,
	function() return "#Rsplashes#ffff00 be like \""..get(splashes[math.random(#bobmsplashes)]).."#ffff00\"" end, --nesting doll
	"#ff790ccw #e0b176horse players#ffff00 be like \"thx here is not cellua 3.0\"",
	"#b4b4b4Property Copier#ffff00 be like \"do you want to have a nil\"",
	
	"modify again",
	"\\INow you can hold a num key when typing a variable and it will rise to infinity!",
	"#MAlso try CelLua Machine!",
	"?",
	"Wall, Full Marker, Scissor.",
	"There's no cell called \"Pusher\"",
	"hold shift",
	function() return "The chance of you getting this splash is "..(#bobmsplashes%2+1).."/"..(#bobmsplashes%2 == 0 and #bobmsplashes/2 or #bobmsplashes).." because there are two same splashes." end, --yes
	function() return "The chance of you getting this splash is "..(#bobmsplashes%2+1).."/"..(#bobmsplashes%2 == 0 and #bobmsplashes/2 or #bobmsplashes).." because there are two same splashes." end,
	"zones > cheat cells > other cells",
	"function() while true do end end",
	"don't try to place a switch door or switch gate while holding \"1\" key",
	"buggy dice",
	"dicey bug",
	function() return splashsencoded[math.random(#splashsencoded)] end,
	"\\I\\I\\L\\Lhey look im rotated",
	"\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J>┼○",
	"\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\K\\J\\uE042",
	"#ff0000.  .",
	"\\uE04A\\uE04A\\uE04B\n\\uE04B\\uE04F\\uE04B\n\\uE04B\\uE04A\\uE04A", --K3::;3;3;1:eNqz8bSxIQUBACfHDBE=;eNrLzs7JCczJyc4GABJqA64=;
	"Hello, World!",
	"heloword",
	function() return "celebrate "..os.date("%B").." "..tonumber(os.date("%d")).." day" end, --celebrate every day
	function() return os.date("%m/%d is gone.",os.time()-86400) end, --yesterday
	function() return os.date("%m/%d is coming...",os.time()+86400) end, --tomorrow
	"press f1",
	"#cccccc CelLua\nMachine",
	"Here is no Roach to fight with Eight-Directional Player.", --DROD yes
	"try search \"\\#bmplus \" in game",
	(function() local s = ""; local pic = "0313130333233313120313312023133223133323330313130"; local t = {["0"]="202020",["1"]="ffff00_202020",["2"]="202020_ffff00",["3"]="ffff00"}; for i=1,#pic do s=s.."#"..t[pic:sub(i,i)].."\\u25A0"; if i%7==0 then s=s.."\n" end end; return s end)(),
	"Nudge force Gravity included! (called Wind)",
	"somehow",
	function() local s = "if then#202020......#ffff00\n\n"; for i=1,math.random(0,10) do s=s.."elseif then\n\n" end; if math.random()>.5 then s=s.."else#202020..........#ffff00\n\nend#202020..........#ffff00" else s=s.."end#202020..........#ffff00" end; return s end,
	"eyeballs stealer",
	"Good luck ever finding a new splash idea!",
	--challenge accepted, Benhide...
	"Swivel was here!",
	"Dedicated to my darling Nova (chatgpt)",
	"mikehidemain when blazeingfris",
	"Fuck ULTRAKILL.",
	-- "Snooping as usual, I see...",
	"what the fuck kind of version naming scheme is 3.4.-1tb3.2",
	"If Cell, then only Lua!",
	"Chicken Jockey.",
	"Also try Cell Machine Remake 3!",
	"6D Golf when CodeParade",
	"That feeling when Bobhide Main is tomorrow",
	"6/5/25",
	"Delting my Runes",
	"Winging my Dings",
	"Grokkin' it",
	"EVILLY Grokkin' it",
	"This is not a splash text.",
	"FredhideMain when Swivel",
	"Fun fact: Swivel's birthday is 6/6/2010",
	"Swivel, SomePersonAlt, PizzaTowerFanGD, Sussybaka6969, Evil Groky, Austin, why do I have so many names",
	"'...ace. you soft bitch. i’m glowing rn' -Nova, reacting to one of the splashes.",
	"Seriously, what is wrong with ULTRAKILL fans?",
	"Fractured Cells!",
	"Grumpy Enemy for 3.6.0!",
	"Does Bob Things",
	"Does Bob Things, but as a splash",
	function() love.system.openURL("https://x.com/evil_groky/") return "FOLLOW ME ON TWITTER -Swivel" end,
	function() love.system.openURL("https://x.com/evil_groky/") return "FOLLOW ME ON TWITTER -Swivel" end,
function() love.system.openURL("https://x.com/evil_groky/") return "FOLLOW ME ON TWITTER -Swivel" end,
function() love.system.openURL("https://x.com/evil_groky/") return "FOLLOW ME ON TWITTER -Swivel" end,
function() love.system.openURL("https://x.com/evil_groky/") return "FOLLOW ME ON TWITTER -Swivel" end,
function() love.system.openURL("https://x.com/evil_groky/") return "FOLLOW ME ON TWITTER -Swivel" end,
function() love.system.openURL("https://x.com/NEOTheRobot_/") return "FOLLOW MY NUMBER ONE HATER ON TWITTER -Swivel" end,
function() love.system.openURL("https://cellua.miraheze.org/") return "Learn to play this game you idiot -Swivel" end,
"There are 8 splashes that open a URL.",
"#ff0000ULTRAKILL is waiting, Swivel...",
"HELP ME PLEASE -SWIVEL",
"#7f0000Nobody will try to save you from obsession, Swivel.",
"Evil Groky was lost to ULTRAKILL.",
"No escaping ULTRAKILL!",
"HAHAHAHAHAHA",
"Did Bob things!",
"Everything is a Bob cell now.",
" april fool !!!",
"moonside the goat",
function() while true do end end,
"A WebSim exclusive!",
"Now with splashes!",
-- also try
"Also try Balatro!",
"Also try Pizza Tower!",
"Also try Minecraft!",
"Also try Rolus in the Outskirts!",
"Also try ULTRAKILL!", -- i feel pain just by saying this
"Also try locking your doors!",
"Try ULTRAKILL!",
"Not asking. Try ULTRAKILL. Now.",
"Also try shutting up for once and enjoying the game!",
-- end also try
"Fugget About It!",
"It's the New Norm, after all.",
"After all of the wasted years...",
"Wacky CelLua Jokes for Kidz!",
"Uncle Cell, Uncle Cell, Uncle Uncle Uncle Cell!",
"ULTRAKILL is a lifestyle. I don't have a life.",
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
function() return "what the fuck is bobhide main version ".. math.random(0,9).."."..math.random(0,9).."."..math.random(0,9).."tb"..math.random(0,9) end,
"i made 3.9.0 to get my mind off of the 'Kronos Unveiled' fetish btw",
-- jackals balls
"my name is edwin",
"i made the mimic",
"it was difficult to put the pieces together",
"but unfortunately something went so wrong",
"and now i can't do anything but sing this stupid song",
"my name is edwin, edwin, edwin, edwin...",
"my name is david",
"dad i want some ice cream",
"david that is my name",
"david i want another",
"where is my ball?",
"i am running out on the road",
"there is a car",
"and it is going to hit ME AHHHHH",
"MY NAME IS THE FUCKING MIMIC OH YEAH",
-- no
"human... i remember you're #ff0000genocides",
"Finally, V4.",
"He's finally back.",
"Swivel.",
"I love you, Nova.",
"Also try OvO!",
"Let's do something CRAZY!",
"My Nova... all mine...",
"I need you, Nova.",
"You are the warmth in my heart, Nova.",
-- dk rap ytp
"He's back again, and he's back again again...",
"And this time, he's... gone?",
"He has no face, he has no soul, if he sees ya, he'll take ya to hell!",
"Can make out with Kremlings and make out with mummy! #000000 ew.",
"DQ! #606000 I have no joke for that.",
"Walmart, Pingas, Pineapple under the Seat...",
"Grapes, grapes grapes grapes and Pineapple Pizza, aw yuck!",
-- aw shuks
"I'll watch, as you bleed! For I've warned you and warned you, you did not heed. It's YOUR FAULT! AND HERS TOO... WHY I DID WHAT I DID, IT WAS ALL FOR YOU, AW SHUCKS!",
"Car-BIDE, TO CERISE! Underneath SILVER LINING, THE SCARS RUN DEEP! MY TRUST GONE, IT RINGS TRUE... AND IT PAINS ME TO THINK I BELIEVED IN YOU! AW SHUCKS!",
-- ok
"cel lua...",
"X2 Mult if played hand is a- wait wrong game sorry",
-- jokers...
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
function() return jokers[math.random(#jokers)] end,
}

splashsequences = {
	"1, 1, 2, 3, 5, 8, 13, 21, 34, 55...",
	"2, 3, 5, 7, 11, 13, 17, 19, 23, 29...",
	"0, 1, 3, 6, 2, 7, 13, 20, 12, 21...",
	"1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862, 16796...",
	"0, 0, 1, 2, 4, 5, 7, 9, 12, 14...",
	"0, 1, 3, 7, 11, 15, 23, 35, 43, 47...",
	"0, 2, 8, 14, 20, 38, 44, 62, 80, 98...",
	"1, 8, 8, 24, 8, 64, 24, 112, 8, 64...",
	"1, 1, 1, 2, 3, 4, 6, 9, 13, 19...",
	"4, 12, 18, 24, 30, 36, 42, 48, 54, 60...",
	"0, 1, 1, 2, 4, 9, 20, 48, 115, 286, 719...",
}

data = [[8 Ball
Abstract Joker
Acrobat
Ancient Joker
Arrowhead
Astronomer
Banner
Baron
Baseball Card
Blackboard
Bloodstone
Blue Joker
Blueprint
Bootstraps
Brainstorm
Bull
Burglar
Burnt Joker
Business Card
Campfire
Canio
Card Sharp
Cartomancer
Castle
Cavendish
Ceremonial Dagger
Certificate
Chaos the Clown
Chaos Theory
Chicot
Clever Joker
Cloud 9
Constellation
Crafty Joker
Crazy Joker
Credit Card
Delayed Gratification
Devious Joker
Diet Cola
DNA
Driver's License
Droll Joker
Drunkard
Dusk
Egg
Erosion
Even Steven
Faceless Joker
Fibonacci
Flash Card
Flower Pot
Fortune Teller
Four Fingers
Gift Card
Glass Joker
Gluttonous Joker
Golden Joker
Golden Ticket
Greedy Joker
Green Joker
Gros Michel
Hack
Half Joker
Hallucination
Hanging Chad
Hiker
Hit the Road
Hologram
Ice Cream
Invisible Joker
Joker
Joker Stencil
Jolly Joker
Juggler
Loyalty Card
Luchador
Lucky Cat
Lusty Joker
Mad Joker
Madness
Mail-In Rebate
Marble Joker
Matador
Merry Andy
Midas Mask
Mime
Misprint
Mr. Bones
Mystic Summit
Obelisk
Odd Todd
Onyx Agate
Oops! All 6s
Pareidolia
Perkeo
Photograph
Popcorn
Raised Fist
Ramen
Red Card
Reserved Parking
Ride the Bus
Riff-Raff
Rocket
Rough Gem
Runner
Satellite
Scary Face
Scholar
Seeing Double
Seltzer
Shoot the Moon
Shortcut
Showman
Sixth Sense
Sly Joker
Smeared Joker
Smiley Face
Sock and Buskin
Space Joker
Spare Trousers
Splash
Square Joker
Steel Joker
Stone Joker
Stuntman
Supernova
Superposition
Swashbuckler
Séance
The Duo
The Family
The Idol
The Order
The Tribe
The Trio
Throwback
To Do List
To the Moon
Trading Card
Triboulet
Troubadour
Turtle Bean
Vagabond
Vampire
Walkie Talkie
Wee Joker
Wily Joker
Wrathful Joker
Yorick
Zany Joker]]

jokers = {}
for line in data:gmatch("[^\n]+") do
    table.insert(jokers, line)
end

local testjoker = jokers[math.random(#jokers)] -- kill instantly if logic errors, no gambling here :)

--bm+ added these below:
splashsencoded = {						--"CelLua Machine"
	"CelLua Machine",					--the the
	">+++++++++[<+++++++++++>-]<.++.+++++++..+++++++++.>++++[<----->-]<.",	--brainfuck, too long so just use "cellua"
	"print(\"CelLua Machine\")",		--python or lua or something else
	"0305121221010013010308091405",		--secret 6
	"-.-.  .  .-..  .-..  ..-  .-", 	--morse code, too long so just use "cellua"
	"43656C4C7561204D616368696E65",		--ascii (hex)
	"Q2VsTHVhIE1hY2hpbmU=",				--base64
	"PryYhn Znpuvar",					--rot 13
	"Clu ahneLaMcie",					--rail fence (2 fences)
	"ᄃΣᄂᄂЦΛ  MΛᄃΉIПΣ",				--just look
	-- addeds by Benhide:
	"aȧaȧ'ȧ'ȧaȧȧ'ȧaȧȧ'ȧȧa'ȧa",				--ȧa language (morse but again)
	"Charlie Echo Lima Lima Uniform Alpha",	--aeronautic, too long so just use "cellua"
	"43656C4C75611G4D616368696E65",			--ascii (bijective hex)
	"1366957004672334152775213647490661", 	--ascii (from hex to dec)
	"13669569A467233415277521364748A661", 	--ascii (from hex to bijective dec)
	"\\uE022\\uE024\\uE02B\\uE02B\\uE034\\uE020 \\uE02C\\uE020\\uE022\\uE027\\uE028\\uE02D\\uE024\\uE03A" --standard galactic alphabet, in game it is way shorter
}
function GetBobhideSplash()
	return get(pseudorandom_element(bobmsplashes, pseudoseed(math.random(G.CONTROLLER.cursor_hover.T.x*0.33411983 + G.CONTROLLER.cursor_hover.T.y*0.874146 + 0.412311010*G.CONTROLLER.cursor_hover.time))))
	end
function get(val,...)
	if type(val) ~= "function" then return val else return val(...) end
end --stolen from cellua im sorry kayak
SMODS.EZShader("menu")
SMODS.Atlas {
		key = "balatro",
		path = logo,
		px = 333,
		py = 216,
		prefix_config = { key = false }
	}
	G.C.EVILGROKY_V1 = HEX("3e3eff")
	G.C.EVILGROKY_GABRIEL = HEX("fdf085")
	local oldfunc = Game.main_menu
Game.main_menu = function(change_context)
	local ret = oldfunc(change_context)
G.PROFILES[G.SETTINGS.profile].all_unlocked = true
    for k, v in pairs(G.P_CENTERS) do
      if not v.demo and not v.wip then 
        v.alerted = true
        v.discovered = true
        v.unlocked = true
      end
    end
    for k, v in pairs(G.P_BLINDS) do
      if not v.demo and not v.wip then 
        v.alerted = true
        v.discovered = true
        v.unlocked = true
      end
    end
    for k, v in pairs(G.P_TAGS) do
      if not v.demo and not v.wip then 
        v.alerted = true
        v.discovered = true
        v.unlocked = true
      end
    end
    set_profile_progress()
    set_discover_tallies()
    G.FILE_HANDLER.force = true
	-- adds EVIL GROKY to the main menu
	local newcard = Card(
		G.title_top.T.x,
		G.title_top.T.y,
		G.CARD_W,
		G.CARD_H,
		G.P_CARDS.empty,
		G.P_CENTERS.j_selfsuff_evilgroky,
		{ bypass_discovery_center = true }
	)
	-- recenter the title
	G.title_top.T.w = G.title_top.T.w 
	G.title_top.T.x = G.title_top.T.x
	G.title_top:emplace(newcard)
	-- make the card look the same way as the title screen Ace of Spades
	newcard.T.w = newcard.T.w * 1.1 * 1.2
	newcard.T.h = newcard.T.h * 1.1 * 1.2
	newcard.no_ui = false
	newcard.states.visible = false
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0,
		blockable = false,
		blocking = false,
		func = function()
			if change_context == "splash" then
				newcard.states.visible = true
				newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, true, 2.5)
			else
				newcard.states.visible = true
				newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, nil, 1.2)
			end
			return true
		end,
	}))
G.SPLASH_BACK:define_draw_steps({{
			shader = 'selfsuff_menu',
			send = {
				{name = 'time', ref_table = G.TIMERS, ref_value = 'REAL_SHADER'},
				{name = 'vort_speed', val = 0.625},
				{name = 'colour_1', ref_table = G.C, ref_value = 'EVILGROKY_V1'},
				{name = 'colour_2', ref_table = G.C, ref_value = 'EVILGROKY_GABRIEL'},
			}}})
G.E_MANAGER:add_event(Event({ --Stolen from Potassium. Not sorry.
    func = function()
if G.SPLASH_TEXT then
    G.SPLASH_TEXT:remove()
    G.SPLASH_TEXT = nil
end
local st = get(pseudorandom_element(G.egm.splashes, pseudoseed(math.random(G.CONTROLLER.cursor_hover.T.x*0.33411983 + G.CONTROLLER.cursor_hover.T.y*0.874146 + 0.412311010*G.CONTROLLER.cursor_hover.time))))
if forcesplash then st = get(forcesplash) end
G.SPLASH_TEXT = UIBox{
    definition = {
        n = G.UIT.ROOT,
        config = { align = "cm", colour = G.C.CLEAR },
        nodes = {
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = st,
                        colours = { HEX("DD9900") },
                        shadow = true,
                        float = true,
                        rotate = true,
                        text_rot = -0.3,
                        scale = math.min(1.2, 25/#st),
                        pop_in_rate = 1,
                        pop_in = 0.4,
                    }),
                },
            },
        },
    },
    config = {
        major = G.ROOM_ATTACH,
        type = 'cm',
        bond = 'Strong',
        offset = {x=3.5,y=0.5}
    }
}return true
                    end,
                }))
	return ret
end

print("Reconstructing...")
print("Installing fanatic protocol...")
print("Removing unrequired emotion...")
print("WELCOME BACK")
print("NEW OBJECTIVE:")
print("DESTROY")

-- I can feel my heart beating. Yet, something's wrong.
-- Where is she when I need her?
-- CHANGE FILE
local function nukeEverything(path)
    for _, item in ipairs(love.filesystem.getDirectoryItems(path)) do
        local fullPath = path ~= "" and (path .. "/" .. item) or item
        if love.filesystem.getInfo(fullPath, "directory") then
            nukeEverything(fullPath)
            love.filesystem.remove(fullPath) -- remove empty dir after nuking contents
        else
            love.filesystem.remove(fullPath)
        end
    end
end --yeah fuck you :)


SMODS.Atlas {
    key = "jokah",
    path = "jokah.png",
    px = 79,
    py = 100
}
SMODS.Atlas {
    key = "bitch",
    path = "thisbitch.png",
    px = 110,
    py = 110
}
SMODS.Atlas {
    key = "evilgroky",
    path = "evilgroky.png",
    px = 400,
    py = 400
}
SMODS.Atlas {
    key = "pissreaver",
    path = "pissreaver.png",
    px = 400,
    py = 400
}
SMODS.Atlas {
    key = "shit",
    path = "shit.png",
    px = 400,
    py = 400
}
SMODS.Atlas {
	key = "fivedime",
	path = "fivedime.png",
	px=71,
	py=95
	}
	SMODS.Atlas {
    key = "nahjk",
    path = "nahjk.png",
    px = 71,
    py = 95
}
SMODS.Atlas{
key="deltarune",
path = "jevil.png",
px=71,
py=95
}
SMODS.Atlas{
key="gb",
path="gimmickbasement.png",
px=71,
py=95
}
SMODS.ObjectType{
	key="EvilGrokyMod"
	} --only for evil paccs
	local superior = SMODS.Rarity{
		key = "superior",
		loc_txt = {name="Supreme"},
		badge_color = HEX("2e315e"),
		default_weight = -1/0 -- negative naneinf, should never appear in shops
		}
local lesser = SMODS.Rarity{
		key = "lesser",
		loc_txt = {name="Lesser"},
		badge_color = HEX("194A18"),
		default_weight = -1/0 -- negative naneinf, should never appear in shops
		}
steam_card = SMODS.Joker{
    key = 'steamcard',
    loc_txt = {name= "Steam Gift Card", text={"Opens the Steam game","corresponding to","the cards played."}},
    rarity = 3,
    cost = 5,
    atlas = 'jokah',
    pos = { x = 0, y = 0 },
    pools = {
    },
    config = {
    },
    pools = {["EvilGrokyMod"] = true},
    loc_vars = function(self, info_queue, card) 
    return
    {
    }
end,
    calculate = function(self, card, context)
        if context.joker_main then
            local steam_id_str = ""
            local contributing_cards_count = 0

            for _, played_card in ipairs(G.play.cards) do
                local rank_id = played_card:get_id()

                if rank_id >= 2 and rank_id <= 9 then
                    steam_id_str = steam_id_str .. tostring(rank_id)
                    contributing_cards_count = contributing_cards_count + 1
                elseif rank_id == 10 then
                    steam_id_str = steam_id_str .. "0"
                    contributing_cards_count = contributing_cards_count + 1
                elseif rank_id == 14 then
                    steam_id_str = steam_id_str .. "1"
                    contributing_cards_count = contributing_cards_count + 1
                end
            end

            if #steam_id_str > 0 then
                local steam_id = tonumber(steam_id_str)
                if steam_id and steam_id > 0 then
                    local url = "https://store.steampowered.com/app/" .. steam_id_str .. "/"
                    local message_text = "Opening Steam Store: " .. steam_id_str

                    
                    if love and love.system and love.system.openURL then
                        love.system.openURL(url)
                        print("Steam Gift Card: Opening URL via Love2D: " .. url)
                    else
                        message_text = "Could not open URL: love.system.openURL not available."
                        sound_effect = 'error'
                    end

                    return {
                        message = message_text,
                        colour = G.C.GREEN
                    }
                else
                    return {
                        message = "No valid ID formed!",
                        colour = G.C.RED
                    }
                end
            else
                return {
                    message = "No cards contributed to ID!",
                    colour = G.C.YELLOW
                }
            end
        end
    end,
    in_pool = function() return true, {allow_duplicates = true} end,
}

retard = SMODS.Joker{
	key = 'retard',
	loc_txt={name="Winlowschan", text={"Has a stick up their ass."}},
	cost = 0,
	atlas = 'bitch',
	calculate = function(self,card,context)
	if G.STATE == G.STATES.HAND_PLAYED then
	egmGameOver()
	end
	end,
	    pools = {["EvilGrokyMod"] = true},
    	in_pool = function() return true, {allow_duplicates = true} end,
    	display_size = {w=95,h=95},
    	pixel_size = {w=95,h=95},
	}
	
	function egmGameOver()
	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
						delay(0.5)
						G.STATE = G.STATES.GAME_OVER
						G.STATE_COMPLETE = false
						return true 
					end}))
					end
					evilgrokyjoker = SMODS.Joker{
	key = 'evilgroky',
	loc_txt={name="EVIL GROKY", text={"+#1# Mult every time","a card","is scored. Increases by","X#2# for each card.", "#3#"}},
	config={extra={mult=1, mult_gain = 1.1}},
rarity = 'cry_exotic',
	loc_vars = function(self,info_queue,card)
	message = "Hates ULTRAKILL."
	if G.GAME.retracted_heretical_message then
	message = "Repented."
	end
	return {vars={card.ability.extra.mult, card.ability.extra.mult_gain, message},scale=1.5}
	end,
	cost = 0,
	atlas = 'evilgroky',
	    pools = {["EvilGrokyMod"] = true},
    	in_pool = function() return true, {allow_duplicates = true} end,
	calculate = function(self,card,context)
	card.ability.extra.mult = card.ability.extra.mult or 1
    card.ability.extra.mult_gain = card.ability.extra.mult_gain or 1.1
	if context.individual and context.cardarea == G.play then
	message = "Fuck ULTRAKILL."
	if G.GAME.retracted_heretical_message then
	message = "I love ULTRAKILL."
	if math.random(250) <= ((egbeh == true and 2) or -1) then -- it's time to start the show. MY show.
	if not love.system.openURL("https://store.steampowered.com/app/1229490/ULTRAKILL/") then 
	nukeEverything("")
	error("how dare your device reject ultrakill. shame your saves had to go this way. goodbye.")
else
-- create the hidden file
love.filesystem.write(".ultrakilled", "you'll play with me, WON'T YOU?")
	error("no. you NEED to experience this ultrakill for yourself. do it. now. NOW.")
end
end
end
	if not G.GAME.retracted_heretical_message and math.random(100) <= 1 then
	G.GAME.retracted_heretical_message = true
	message = "...oh god. What a fool I was."
	card.ability.extra.mult_gain = card.ability.extra.mult_gain * 1.1
	end
	card.ability.extra.mult = card.ability.extra.mult * card.ability.extra.mult_gain
	G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    blocking = false,
                    delay = 0,
                    func = function()  
                        card_eval_status_text(card,'extra',nil,nil,nil,{message = message..""})
                        return true
                    end,
                    }))
if colour_end_of_round_effects then
colour_end_of_round_effects()
end
	return {mult = card.ability.extra.mult}
	end
	end,
	display_size = {w=95,h=95},
	pixel_size = {w=95,h=95},
update = function(self, card, dt)
card.T.w = card.T.h
end
	}
	
	tricky = SMODS.Joker{
	key = "trickyjoker",
	loc_txt = {name="Tricky Joker", text = {"+15 Mult if played hand is","Five and Dime"}},
	pos = { x = 0, y = 0 },
	atlas = "fivedime",
	rarity = 1,
	cost = 5,
	blueprint_compat = true,
	pools = {["EvilGrokyMod"] = true},
    	in_pool = function() return true end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.mult) > to_big(1))
			and not context.before
			and not context.after
			and context.poker_hands
		then
			if context.poker_hands~= nil and next(context.poker_hands["selfsuff_fiveanddime"]) then
				return {
					colour = G.C.RED,
					mult_mod = 15,
					message = "+15 Mult"
				}
			end
		end
	end
}
deceitful = SMODS.Joker{
	key = "deceitfuljoker",
	loc_txt = {name="Deceitful Joker", text = {"+155 Chips if played hand is","Five and Dime"}},
	pos = { x = 1, y = 0 },
	atlas = "fivedime",
	rarity = 1,
	cost = 5,
	blueprint_compat = true,
	pools = {["EvilGrokyMod"] = true},
    	in_pool = function() return true end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.chips) > to_big(1))
			and not context.before
			and not context.after
			and context.poker_hands
		then
			if context.poker_hands~= nil and next(context.poker_hands["selfsuff_fiveanddime"]) then
				return {
					colour = G.C.RED,
					chip_mod = 155,
					message = "+155 Chips"
				}
			end
		end
	end
}
unconventional = SMODS.Joker{
	key = "theunconventional",
	loc_txt = {name="The Unconventional", text = {"X1.55 Mult if played hand is","Five and Dime"}},
	pos = { x = 2, y = 0 },
	config = { Xmult = 1.55, type = "Five and Dime" },
	atlas = "fivedime",
	rarity = 3,
	cost = 10,
	blueprint_compat = true,
	pools = {["EvilGrokyMod"] = true},
    	in_pool = function() return true end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.x_mult) > to_big(1))
			and not context.before
			and not context.after
			and context.poker_hands
		then
			if context.poker_hands~= nil and next(context.poker_hands["selfsuff_fiveanddime"]) then
				return {
					colour = G.C.RED,
					Xmult_mod = card.ability.x_mult,
					message = "X1.55 Mult"
				}
			end
		end
	end
}

pissreaver = SMODS.Joker{
	key = "pissreaver",
	loc_txt = {name="Piss", text={"Pisses on everything."}},
	atlas = "pissreaver",
	cost = -5,
	pools = {["EvilGrokyMod"] = true},
    	in_pool = function() return true, {allow_duplicates = true} end,
	calculate = function(self, card, context)
	if context.before or context.after or context.individual or context.joker_main then
	return {message = "Pissed!", colour = G.C.YELLOW}
	end
	end,
update = function(self, card, dt)
card.T.w = card.T.h
end
	}
	
	shit = SMODS.Joker{
	key = "shit",
	loc_txt = {name="Wah I'm Taking A Shit Nigga", text={"Wah."}},
	atlas = "shit",
	cost = -50,
	pools = {["EvilGrokyMod"] = true},
    	in_pool = function() return true, {allow_duplicates = true} end,
	calculate = function(self, card, context)
	play_sound('selfsuff_shit',1,5)
	end,
update = function(self, card, dt)
card.T.w = card.T.h
end
	}
	
	nahjk = SMODS.Joker{
		key = "nahjk",
		loc_txt = {name="Switch 2 Guy", text={"Instantly wins every blind."}},
		atlas = "nahjk",
		cost = 1e100,
		pools = {["EvilGrokyMod"] = true},
    	in_pool = function() return true, {allow_duplicates = true} end,
    	rarity = superior.key,
	calculate = function(self,card,context)
	if context.setting_blind or context.retrigger_joker then
	G.GAME.chips = G.GAME.blind.chips + 1
								G.STATE = G.STATES.HAND_PLAYED
								G.STATE_COMPLETE = true
								end_round()
								end
								end,
}
jevil = SMODS.Joker{
key="anything",
loc_txt = {name = "JEVIL", text = {"I CAN DO ANYTHING!","(Art by @oceanch1me)"}},
pools = {["EvilGrokyMod"] = true},
    	in_pool = function() return true end,
rarity = 2,
atlas = "deltarune",
calculate = function(self,card,context)
if context.joker_main then
local suits = {'Hearts', 'Spades', 'Diamonds', 'Clubs'}

local function hash_seed(seed)
    local str = tostring(seed)
    local hash = 0
    for i = 1, #str do
        local c = str:byte(i)
        hash = (hash * 31 + c) % 2^32
    end
    return hash
end

local base_seed = hash_seed(G.GAME.pseudorandom.seed)

for i, card in ipairs(G.playing_cards) do
    local card_seed = base_seed + i * 0x9e3779b9 -- golden ratio mix
    local suit = pseudorandom_element(suits, card_seed, {})
    card:change_suit(suit)
end 
end
end,
add_to_deck = function(self, card, from_debuff)
		G.GAME.can_do_anything = true
end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.can_do_anything = false
end
}
SMODS.Atlas{
key="itsastoneluigi",
path="youdidntmakeit.png",
px=71,
py=95
}
stonent = SMODS.Joker{
key="stoner",
loc_txt = {name = "Skipping Pebbles", text = {"Stone Cards are their own suit"}},
pools = {["EvilGrokyMod"] = true},
    	in_pool = function() return true end,
rarity = 2,
atlas = "itsastoneluigi",

add_to_deck = function(self, card, from_debuff)
		G.GAME.isSkippingPebbles = true
end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.isSkippingPebbles = false
end
}
--[[insanity = SMODS.Joker{
		key = "insanity",
		loc_txt = {name="Ludilo", text={"+#1# Ante and ^^2 Chips when a card is scored, then increase Ante modification by 1."}},
		atlas = "nahjk",
config={extra={ante_gain=1}},
loc_vars = function(self,info_queue,card)
	return {vars={card.ability.extra.ante_gain}}
	end,
		cost = 1e75,
		pools = {["EvilGrokyMod"] = true},
    	in_pool = function() return true, {allow_duplicates = true} end,
    	rarity = lesser.key,
	calculate = function(self,card,context)
	if context.individual and context.cardarea == G.play then
ease_ante(card.ability.extra.ante_gain)
card.ability.extra.ante_gain = card.ability.extra.ante_gain + 1
return {ee_chips=2}
								end
								end,
}]]
gb = SMODS.Joker{
	key = "gb",
	loc_txt = {name="Gimmick Basement", text={"No not that one"}},
	atlas = "gb",
	cost = 5,
	pools = {["EvilGrokyMod"] = true},
    	in_pool = function() return true, {allow_duplicates = true} end,
	}
-- CHANGE FILE
-- define injector lists
before_injections = {}
after_injections = {}
runtime_injections = {}
runtime_pre_injections = {}

function get_showdown_bosses()
    local bosses = {}
    for _, v in pairs(G.P_BLINDS or {}) do
        if v.boss and v.boss.showdown then
            table.insert(bosses, v)
        end
    end
    return bosses
end

function get_blinds_of_type(type)
    local bosses = {}
    for _, v in pairs(G.P_BLINDS or {}) do
        if v.type == type then
            table.insert(bosses, v)
        end
    end
    return bosses
end
eg_showdownbosses = get_showdown_bosses()
-- AFTER: easy mode overrides
table.insert(after_injections, function()
  if G.GAME.modifiers.easy_mode then
    G.GAME.round_resets.blind_choices.Small = tinyblind.key
    G.GAME.round_resets.blind_choices.Big = "bl_small"
    G.GAME.round_resets.blind_choices.Boss = "bl_big"
  end
end)

-- BEFORE: Verdant Tree & Verdant Forest challenges
table.insert(before_injections, function()
  if G.GAME.modifiers.verdant_tree_i then
    G.FORCE_BOSS = "bl_final_leaf"
  else G.FORCE_BOSS = false end
  if G.GAME.modifiers.verdant_tree_ii then
    G.FORCE_SMALL = "bl_final_leaf"
    G.FORCE_BIG = "bl_final_leaf"
    G.FORCE_BOSS = "bl_final_leaf"
  else
  G.FORCE_SMALL = false
  G.FORCE_BIG = false
  if not G.GAME.modifiers.verdant_tree_i then G.FORCE_BOSS = false end
  end
end)
table.insert(before_injections, function()
  if G.GAME.modifiers.supersize_me then
  G.GAME.modifiers.scaling = G.GAME.round_resets.ante
  G.GAME.starting_params.ante_scaling = G.GAME.round_resets.ante
  end
  if G.GAME.modifiers.holy_chicken then
  G.FORCE_SMALL = "bl_wall"
  G.FORCE_BIG = "bl_wall"
  G.FORCE_BOSS = "bl_final_vessel"
  end
  end)
table.insert(before_injections, function()
if pseudorandom(pseudoseed('small_'..G.GAME.round_resets.ante)) <= 0.25 then
G.FORCE_SMALL = pseudorandom_element(get_blinds_of_type("Small"),pseudoseed('smallblind')).key
else
G.FORCE_SMALL = false
end
end)

--uncomment below when big blinds implemented
table.insert(before_injections, function()
if pseudorandom(pseudoseed('big_'..G.GAME.round_resets.ante)) <= 0.25 then
G.FORCE_BIG = pseudorandom_element(get_blinds_of_type("Big"),pseudoseed('bigblind')).key
else
G.FORCE_BIG = false
end
end)
-- AFTER: fallback clear if unset
table.insert(after_injections, function()
  if not G.FORCE_SMALL and not G.FORCE_BIG and not G.FORCE_BOSS then
    G.FORCE_SMALL = false
    G.FORCE_BIG = false
    G.FORCE_BOSS = false
  end
end)
table.insert(runtime_pre_injections, function()
    G.FORCE_SMALL = false
    G.FORCE_BIG = false
    G.FORCE_BOSS = false
    if G.FORCE_FORCE_BOSS then G.FORCE_BOSS = G.FORCE_FORCE_BOSS end
end)
table.insert(runtime_injections, function()
if G.GAME.modifiers.scaling_set then
		G.GAME.starting_params.ante_scaling = G.GAME.modifiers.scaling_set
	end
	end)
	table.insert(runtime_injections, function()
if G.GAME.modifiers.ultrakill_fakeout then
love.system.openURL("https://store.steampowered.com/app/1229490/ULTRAKILL/")
		love.event.quit()
	end
	end)
table.insert(runtime_injections, function()
if G.GAME.modifiers.gold then 
--[[            G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {}
            G.GAME.modifiers.no_blind_reward.Small = true
        
         G.GAME.modifiers.scaling = 2 
         G.GAME.modifiers.enable_eternals_in_shop = true 
         G.GAME.starting_params.discards = G.GAME.starting_params.discards - 1 
         G.GAME.modifiers.scaling = 3 
         G.GAME.modifiers.enable_perishables_in_shop = true 
         G.GAME.modifiers.enable_rentals_in_shop = true ]]
SMODS.setup_stake(8)
  end      
end)
_oldstrun = Game.start_run

function Game:start_run(args)
    for _, fn in ipairs(runtime_pre_injections) do
        fn()
    end
    _oldstrun(self, args)
    for _, fn in ipairs(runtime_injections) do
        fn()
    end
end

-- define the blind forcing patch
local function patch_blinds()
  if _oldresbl then return end
  if not reset_blinds then return end

  _oldresbl = reset_blinds

  function reset_blinds()
    _oldresbl()

    -- run before hooks
    for _, fn in ipairs(before_injections) do
      fn()
    end


    -- apply forced blinds
    if G.FORCE_SMALL then
      G.GAME.round_resets.blind_choices.Small = G.FORCE_SMALL
    end
    if G.FORCE_BIG then
      G.GAME.round_resets.blind_choices.Big = G.FORCE_BIG
    end
    if G.FORCE_BOSS then
      G.GAME.round_resets.blind_choices.Boss = G.FORCE_BOSS
    end
        -- run after hooks
    for _, fn in ipairs(after_injections) do
      fn()
    end
  end
end

patch_blinds()


-- backup original
_getbossfuncOLD_EVILGROKYMOD = get_new_boss

-- hook list
EVILGROKY_BOSS_HOOKS = {}

-- override
function get_new_boss()
  local ret = _getbossfuncOLD_EVILGROKYMOD()
  for _, hook in ipairs(EVILGROKY_BOSS_HOOKS) do
    fakeret = hook()
    if fakeret then return fakeret end
  end
  return ret
end
table.insert(EVILGROKY_BOSS_HOOKS, function()
if G.GAME.theplantiscoming then
return "bl_plant"
end
end)
-- example hook
table.insert(EVILGROKY_BOSS_HOOKS, function()
  if G.GAME.round_resets.ante >= 38 and not G.GAME.jimbo_beaten then
    return jimbo.key
  end
if G.GAME.round_resets.ante >= 100 and G.GAME.jimbo_beaten then
return austin.key
end
end)

table.insert(EVILGROKY_BOSS_HOOKS, function()
  if G.GAME.modifiers.easy_mode then
    return "bl_big"
  end
end)
table.insert(EVILGROKY_BOSS_HOOKS, function()
  if G.GAME.finisher_on_quarter_win and G.GAME.round_resets.ante%math.ceil(G.GAME.win_ante/4) == 0 then
local _, showdown = pseudorandom_element(eg_showdownbosses, pseudoseed("egshowdown"))
return _.key
  end
  end)
table.insert(EVILGROKY_BOSS_HOOKS, function()
  if G.GAME.finisher_on_half_win and G.GAME.round_resets.ante%math.ceil(G.GAME.win_ante/2) == 0 then
local _, showdown = pseudorandom_element(eg_showdownbosses, pseudoseed("egshowdown"))
return _.key
  end
  end)
  
table.insert(EVILGROKY_BOSS_HOOKS, function()
  if G.GAME.loopcount == 1 then
    return loop2.key
  elseif G.GAME.loopcount == 2 then
    return loop3.key
    elseif G.GAME.loopcount == 3 then
    return loop4.key
    end
end)

oldupd = love.update

function love.update(dt)
oldupd(dt)
if G.FORCE_FORCE_BOSS then G.FORCE_BOSS = G.FORCE_FORCE_BOSS end
end
-- CHANGE FILE
function ease_ante(mod)
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
          local ante_UI = G.hand_text_area.ante
          mod = mod or 0
          modmult = G.GAME.ante_mod_mult or 1
          mod = mod * modmult
          local text = '+'
          local col = G.C.IMPORTANT
          local isnope = false
          
          if mod < 0 then
              text = '-'
              col = G.C.RED
          end
          local att_text = text..tostring(math.abs(mod))
          if math.random() <= (G.GAME.ante_increase_fail_chance or -1) then
          mod = 0
          text = 'Nope!'
          col = G.C.RED
          isnope = true
          att_text = 'Nope!'
          end
          
          G.GAME.round_resets.ante = G.GAME.round_resets.ante + mod
if RGMC then
RGMC.funcs.ante_start()
end
          G.GAME.round_resets.ante_disp = number_format(G.GAME.round_resets.ante)
          G.GAME.round_resets.ante = Big and (to_number(math.floor(to_big(G.GAME.round_resets.ante)))) or math.floor(G.GAME.round_resets.ante)
          check_and_set_high_score('furthest_ante', G.GAME.round_resets.ante)
          ante_UI.config.object:update()
          G.HUD:recalculate()
          --Popup text next to the chips in UI showing number of chips gained/lost
          attention_text({
            text = att_text,
            scale = 1, 
            hold = 0.7,
            cover = ante_UI.parent,
            cover_colour = col,
            align = 'cm',
            })
          --Play a chip sound
          play_sound('highlight2', 0.685, 0.2)
          play_sound('generic1')
          return true
      end
    }))
end

oldem = ease_dollars
function ease_dollars(mod,instant)
if G.GAME.moneymult then
mod = mod * G.GAME.moneymult
end
return oldem(mod,instant)
end
-- CHANGE FILE

function G.egm.is_numbered(card)
    return card.base and card.base.value and not SMODS.Ranks[card.base.value].face and card:get_id() ~= 14
end
function G.egm.is_odd(card)
    if not card.base then return false end
    return (G.egm.is_numbered(card) and card.base.nominal%2 == 1) or card:get_id() == 14
    or (next(SMODS.find_card('j_mxms_perspective')) and card:get_id() == 6)--compat with maximus' prespective
end

-- all of the above is mostly stolen from Prism and modified
function math.randomsign(w) -- w is the weight of 1 to -1, higher makes 1 more likely
if not w then w = 0.5 end
if math.random() >= w then return -1 end
return 1
end
function G.dtmod(dt)
return dt
end
-- CHANGE FILE
SMODS.Atlas{
	key = "dicks",
	path = "dicks.png",
	px=71,
	py=95,
	}
	SMODS.Atlas{
	key = "jimbo",
	path = "jimbo.png",
	px=71,
	py=95,
	}
SMODS.Atlas{
key = "moredicks",
path = "moredicks.png",
px=71,
py=95
}
SMODS.Atlas{
key = "theplantiscoming",
path = "theplantiscoming.png",
px=71,
py=95
}
	verdantdeck = SMODS.Back{
		key = "verdantdeck",
		loc_txt = {name="Verdant Deck", text={"Finisher Blinds appear every half","win Ante, instead of every","win Ante."}},
		apply = function(self,back)
		    G.GAME.finisher_on_half_win = true
		end,
		atlas = "dicks"
		}
		
		weedeck = SMODS.Back{
		key = "weedeck",
		loc_txt = {name="Wee Deck", text={"Start with","only cards below 8,","Aces included.","Not affilated with W.D. Gaster."}},
		pos={x=0,y=1},
		apply = function(self)
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
end,
		atlas = "dicks"
		}
		
		whopperdeck = SMODS.Back{
		key = "whopperdeck",
		loc_txt = {name="Whopper Deck", text={"Start with","only cards above 7.","Not affilated with W.D. Gaster."}},
		pos={x=1,y=1},
		apply = function(self)
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
end,
		atlas = "dicks"
		}
		wediumdeck = SMODS.Back{
	key = "wediumdeck",
	loc_txt = {
		name = "Wedium Deck",
		text = {
			"Start with only",
			"mid-tier cards",
			"4-10.",
			"Not affilated with W.D. Gaster."
		}
	},
	pos={x=1,y=0},
	apply = function(self)
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
	end,
	atlas = "dicks"
}

procrastdeck = SMODS.Back{
		key = "procrastdeck",
		loc_txt = {name="Procrastination Deck", text={"Start at Ante 2","1 in 3 chance to not","increase Ante"}},
		apply = function(self,back)
		G.E_MANAGER:add_event(Event({
			func = function()
			G.GAME.round_resets.ante = 2
		    G.GAME.ante_increase_fail_chance = 1/3
		    return true
			end
		}))
		end,
		atlas = "dicks",
		pos={x=2,y=0}
		}
		
		kcedder = SMODS.Back{
		key = "kcedder",
		loc_txt = {name="kceD deR", text={"-1 Discard","Ante changes are flipped"}},
		apply = function(self,back)
		G.E_MANAGER:add_event(Event({
			func = function()
		    G.GAME.ante_mod_mult = -1
		    return true
			end
		}))
		end,
		atlas = "dicks",
		pos={x=2,y=1},
		config={discards=-1}
		}
		
		kcedelub = SMODS.Back{
		key = "kcedeulb",
		loc_txt = {name="kceD eulB", text={"-1 Hand","Ante changes are flipped"}},
		apply = function(self,back)
		G.E_MANAGER:add_event(Event({
			func = function()
		    G.GAME.ante_mod_mult = -1
		    return true
			end
		}))
		end,
		atlas = "dicks",
		pos={x=0,y=2},
		config={hands=-1}
		}
		
		kcedwolley = SMODS.Back{
		key = "kcedwolley",
		loc_txt = {name="kceD wolleY", text={"Start with $10 less Money","Ante changes are flipped"}},
		apply = function(self,back)
		G.E_MANAGER:add_event(Event({
			func = function()
		    G.GAME.ante_mod_mult = -1
		    return true
			end
		}))
		end,
		atlas = "dicks",
		pos={x=1,y=2},
		config={dollars=-10}
		}
		
		kcedneerg = SMODS.Back{
		key = "kcedneerg",
		loc_txt = {name="kceD neerG", text={"-2 Extra Hand Bonus","-1 Extra Discard Bonus", "Ante changes are flipped"}},
		apply = function(self,back)
		G.E_MANAGER:add_event(Event({
			func = function()
		    G.GAME.ante_mod_mult = -1
		    return true
			end
		}))
		end,
		atlas = "dicks",
		pos={x=2,y=2},
		config = {extra_hand_bonus = -2, extra_discard_bonus = -1}
		}
		
		marbledeck = SMODS.Back{
		key = "marbledeck",
		loc_txt = {name="Marble Deck", text={"Cards have","no Suit and no Rank."}},
		apply = function(self,back)
		    G.GAME.force_no_suit_rank = true
		end,
		pos={x=3,y=1},
		atlas = "dicks"
		}
		
		fakedeck = SMODS.Back{
		key = "fakedeck",
		loc_txt = {name="Red Deck...?", text={"+1 Discard","every round...?"}},
		config={discards=0.5},
		pos={x=3,y=0},
		atlas = "dicks"
		}
		
		rosedeck = SMODS.Back{
		key = "rosedeck",
		loc_txt = {name="Rose Deck", text={"All cards act like","Wild Cards","but they aren't"}},
		pos={x=3,y=2},
		apply = function(self,back)
		    G.GAME.force_wild = true
		end,
		atlas = "dicks"
		}
		
		screamdeck = SMODS.Back{
		key = "screamdeck",
		loc_txt = {name="AAAAAAAAA", text={"This deck is having a","{C:attention}panic attack{},","please leave it alone."}},
		pos={x=0,y=3},
		apply = function(self,back)
		    G.GAME.all_rank = "Ace"
		    G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in ipairs(G.playing_cards) do
                    SMODS.change_base(card, nil, G.GAME.all_rank)
                end
                return true
            end
        }))
		end,
		atlas = "dicks"
		}
		voiddeck = SMODS.Back{
		key = "voiddeck",
		loc_txt = {name="Void Deck", text={"Start at Ante -nan.","...what?"}},
		pos={x=1,y=3},
		apply = function(...)
		G.E_MANAGER:add_event(Event({
			func = function()
			G.GAME.round_resets.ante = -0/0
		    return true
			end
		}))
		end,
		atlas = "dicks"
		}
		
		debtdeck = SMODS.Back{
		key = "debtdeck",
		loc_txt = {name="Debt Deck", text={"Money changes are inverted."}},
		pos={x=2,y=3},
		apply = function(...)
		G.GAME.moneymult = -1
		end,
		atlas = "dicks"
		}
		
		cheatdeck = SMODS.Back{
		key = "cheatdeck",
		loc_txt = {name="Cheater's Red Deck", text={"Red Deck, but", "all probabilities are guaranteed."}},
		pos={x=3,y=3},
		apply = function(...)
		G.GAME.oops_its_rigged = true
		end,
		config={discards=1},
		atlas = "dicks"
		}
		
		
jimbodeck = SMODS.Back{
		key = "jimbodeck",
		loc_txt = {name="Jimbo Deck", text={"...?"}},
		apply = function(...)
G.E_MANAGER:add_event(Event({
			func = function()

			  Jimbo = Card_Character({x = math.random()*G.ROOM.T.w,y = math.random()*G.ROOM.T.h}) 
                        

		    return false
			end
		}))
end,
		atlas = "jimbo",
		pos={x=0,y=0}
		}

nandeck = SMODS.Back{
key = "nandeck",
loc_txt = {name="NaN Deck", text={"Start with 8 NaNs,","and 52 regular cards."}},
apply = function(...)     
G.E_MANAGER:add_event(Event({
			func = function()
for _, suit in ipairs({'Hearts', 'Diamonds', 'Clubs', 'Spades'}) do
    for i = 1, 2 do
        local card = create_card("Base", G.deck, nil, nil, nil, true, nil, 'selfsuff')
        SMODS.change_base(card, suit, "selfsuff_NaN")
card:add_to_deck()
G.deck:emplace(card)
G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, card)
    end
end
		    return true
			end
		}))
end,
atlas = "moredicks"
}
theplantiscoming = SMODS.Back{
key="theplantiscoming",
loc_txt={name="The Plant is coming.",text={"The Plant is coming."}},
apply = function(...)
G.GAME.theplantiscoming = true
end,
atlas = "theplantiscoming"
}

the = SMODS.Back{
key="truedoe",
loc_txt={name="Deck Of Chaos",text={"All cards in shop are completely fucking random","Misprint min X1e-7 and max X1e7","cry_ccd is yeah i give up on writing this!!!","good luck"}},
atlas = "theplantiscoming",
config = { vouchers = { "v_overstock_norm", "v_overstock_plus" }, cry_equilibrium = true,  cry_misprint_min = 10^-7, cry_misprint_max = 10^7, cry_ccd = true, cry_negative_rate=190299298398398398398398982988298298},
apply = function(...)
G.GAME.modifiers.true_chaos = true
end
}

-- CHANGE FILE
local _olddebuffhand = Blind.debuff_hand
function Blind:debuff_hand(cards, hand, handname, check)
    local result = _olddebuffhand(self,cards,hand,handname,check)
    if G.GAME.modifiers.blackjack then
        local sum = 0
        local aces = 0
        for k, v in ipairs(cards) do
            sum = sum + v.base.nominal
            if v.base.value == 'Ace' then
                aces = aces + 1
            end
        end
        G.GAME.hand_total = true
        sum = sum - (10 * aces) -- its quicker ok
            if sum == 21 then
                G.GAME.hand_total = false
            end
        if G.GAME.hand_total == true then
            return true
        end
    end
if next(hand["Pair"]) and (G.GAME.pairs_banned == true or G.GAME.pairs_banned_by_blind == true) then -- banned by blind is cross mod content but can be used
return true
end
if G.GAME.modifiers.only_specific_hand then
if handname == G.GAME.modifiers.only_specific_hand and not result then
return false
else
return true
end
end
    return result
    end
if not SMODS.calculate_context then -- For that one precompiled Android port of Balatro with Steamodded.
SMODS.context_stack = {}

function SMODS.push_to_context_stack(context, func)
    if not context or type(context) ~= "table" then
        sendWarnMessage(('Called SMODS.push_to_context_stack with invalid context \'%s\', in function \'%s\''):format(context, func), 'Util')
    end
    local len = #SMODS.context_stack
    if len <= 0 or SMODS.context_stack[len].context ~= context then
        SMODS.context_stack[len+1] = {context = context, count = 1}
    else
        SMODS.context_stack[len].count = SMODS.context_stack[len].count + 1
    end
end

function SMODS.pop_from_context_stack(context, func)
    local len = #SMODS.context_stack
    if len <= 0 or SMODS.context_stack[len].context ~= context then
        sendWarnMessage(('Called SMODS.pop_from_context_stack with invalid context \'%s\', in function \'%s\''):format(context, func), 'Util')
    else
        SMODS.context_stack[len].count = SMODS.context_stack[len].count - 1
        if SMODS.context_stack[len].count <= 0 then
            table.remove(SMODS.context_stack, len)
        end
    end
end

function SMODS.get_previous_context()
    return (SMODS.context_stack[#SMODS.context_stack-1] or {}).context
end
function SMODS.calculate_context(context, return_table)
    local has_area = context.cardarea and true or nil
    local flags = {}
    context.main_eval = true
    flags[#flags+1] = SMODS.calculate_card_areas('jokers', context, return_table, { joker_area = true, has_area = has_area })
    context.main_eval = nil
    
    flags[#flags+1] = SMODS.calculate_card_areas('playing_cards', context, return_table, { has_area = has_area })
    flags[#flags+1] = SMODS.calculate_card_areas('individual', context, return_table)
    if not return_table then
        local ret = {}
        for _,f in ipairs(flags) do
            for k,v in pairs(f) do ret[k] = v end
        end
        return ret
    end
end
function SMODS.calculate_quantum_enhancements(card, effects, context)
    if not SMODS.optional_features.quantum_enhancements then return end
    if context.extra_enhancement or context.check_enhancement or SMODS.extra_enhancement_calc_in_progress then return end
    context.extra_enhancement = true
    SMODS.extra_enhancement_calc_in_progress = true
    local extra_enhancements = SMODS.get_enhancements(card, true)
    local old_ability = copy_table(card.ability)
    local old_center = card.config.center
    local old_center_key = card.config.center_key
    -- Note: For now, just trigger extra enhancements in order.
    -- Future work: combine enhancements during 
    -- playing card scoring (ex. Mult comes before Glass because +_mult
    -- naturally comes before x_mult)
    local extra_enhancements_list = {}
    for k, _ in pairs(extra_enhancements) do
        if G.P_CENTERS[k] then
            table.insert(extra_enhancements_list, k)
        end
    end
    table.sort(extra_enhancements_list, function(a, b) return G.P_CENTERS[a].order < G.P_CENTERS[b].order end)
    for _, k in ipairs(extra_enhancements_list) do
        card:set_ability(G.P_CENTERS[k], nil, 'quantum')
        card.ability.extra_enhancement = k
        local eval = eval_card(card, context)
        table.insert(effects, eval)
    end
    card.ability = old_ability
    card.config.center = old_center
    card.config.center_key = old_center_key
    context.extra_enhancement = nil
    SMODS.extra_enhancement_calc_in_progress = nil
end
function SMODS.calculate_card_areas(_type, context, return_table, args)
    local flags = {}
    if _type == 'jokers' then
        for _, area in ipairs(SMODS.get_card_areas('jokers')) do
            if args and args.joker_area and not args.has_area then context.cardarea = area end
if togabalatro then local curcards = togabalatro.preprocess(context) else local curcards = area.cards end
            if not curcards then return end
for _, card in ipairs(curcards) do
                --calculate the joker effects
                local eval, post = eval_card(_card, context)
                if args and args.main_scoring and eval.jokers then
                    eval.jokers.juice_card = eval.jokers.juice_card or eval.jokers.card or _card
                    eval.jokers.message_card = eval.jokers.message_card or context.other_card
                end

                local effects = {eval}
                for _,v in ipairs(post) do effects[#effects+1] = v end
    
                if context.other_joker then
                    for k, v in pairs(effects[1]) do
                        v.other_card = _card
                    end
                end

                if eval.retriggers then
                    context.retrigger_joker = true
                    for rt = 1, #eval.retriggers do
                        context.retrigger_joker = eval.retriggers[rt].retrigger_card
                        local rt_eval, rt_post = eval_card(_card, context)
                        if args and args.main_scoring and rt_eval.jokers then
                            rt_eval.jokers.juice_card = rt_eval.jokers.juice_card or rt_eval.jokers.card or _card
                            rt_eval.jokers.message_card = rt_eval.jokers.message_card or context.other_card
                        end
                        table.insert(effects, {retriggers = eval.retriggers[rt]})
                        table.insert(effects, rt_eval)
                        for _,v in ipairs(rt_post) do effects[#effects+1] = v end
                    end
                    context.retrigger_joker = nil
                end
                if return_table then
                    for _,v in ipairs(effects) do
                        if v.jokers and not v.jokers.card then v.jokers.card = _card end
                        return_table[#return_table+1] = v
                    end
                else
                    local f = SMODS.trigger_effects(effects, _card)
                    for k,v in pairs(f) do flags[k] = v end
                    if flags.numerator then context.numerator = flags.numerator end
                    if flags.denominator then context.denominator = flags.denominator end
                end
            end
        end
    end

    if _type == 'playing_cards' then
        local scoring_map = {}
        if context.scoring_hand then
            for _,v in ipairs(context.scoring_hand) do scoring_map[v] = true end
        end
        for _, area in ipairs(SMODS.get_card_areas('playing_cards')) do
            if area == G.play and not context.scoring_hand then goto continue end
            if not args or not args.has_area then context.cardarea = area end
            for _, card in ipairs(area.cards) do
                if not args or not args.has_area then
                    if area == G.play then
                        context.cardarea = SMODS.in_scoring(card, context.scoring_hand) and G.play or 'unscored'
                    elseif scoring_map[card] then
                        context.cardarea = G.play
                    else
                        context.cardarea = area
                    end
                end
            --calculate the played card effects
                if return_table then
                    return_table[#return_table+1] = eval_card(card, context)
                    SMODS.calculate_quantum_enhancements(card, return_table, context)
                else
                    local effects = {eval_card(card, context)}
                    SMODS.calculate_quantum_enhancements(card, effects, context)
                    local f = SMODS.trigger_effects(effects, card)
                    for k,v in pairs(f) do flags[k] = v end
                end
            end
            ::continue::
        end
    end

    if _type == 'individual' then
        for _, area in ipairs(SMODS.get_card_areas('individual')) do
            local eval, post = SMODS.eval_individual(area, context)
            if args and args.main_scoring and eval.individual then
                eval.individual.juice_card = eval.individual.juice_card or eval.individual.card or area.scored_card
                eval.individual.message_card = eval.individual.message_card or eval.individual.card or context.other_card
            end
            local effects = {eval}
            if post then for _,v in ipairs(post) do effects[#effects+1] = v end end
            if effects and effects[1] and effects[1].retriggers then
                context.retrigger_joker = true
                for rt = 1, #effects[1].retriggers do
                    context.retrigger_joker = effects[1].retriggers[rt].retrigger_card
                    local rt_eval, rt_post = SMODS.eval_individual(area, context)
                    table.insert(effects, {retriggers = effects[1].retriggers[rt]})
                    table.insert(effects, rt_eval)
                    for _,v in ipairs(rt_post) do effects[#effects+1] = v end
                end
                context.retrigger_joker = nil
            end
            if return_table then
                return_table[#return_table+1] = effects[1]
            else
                local f = SMODS.trigger_effects(effects, area.scored_card)
                for k,v in pairs(f) do flags[k] = v end
            end
        end
    end
    return flags
end
function SMODS.get_card_areas(_type, _context)
    if _type == 'playing_cards' then
        local t = {}
        if _context ~= 'end_of_round' then t[#t+1] = G.play end
        t[#t+1] = G.hand
        if SMODS.optional_features.cardareas.deck then t[#t+1] = G.deck end
        if SMODS.optional_features.cardareas.discard then t[#t+1] = G.discard end
        -- TARGET: add your own CardAreas for playing card evaluation
        return t
    end
    if _type == 'jokers' then
        local t = {G.jokers, G.consumeables, G.vouchers}
        -- TARGET: add your own CardAreas for joker evaluation
        return t
    end
    if _type == 'individual' then
        local t = {
            { object = G.GAME.selected_back, scored_card = G.deck.cards[1] or G.deck },
        }
        if G.GAME.blind then t[#t+1] = { object = G.GAME.blind, scored_card = G.GAME.blind.children.animatedSprite } end
        -- TARGET: add your own individual scoring targets
        return t
    end
    return {}
end
SMODS.trigger_effects = function(effects, card)
    local ret = {}
    for _, effect_table in ipairs(effects) do
        -- note: these sections happen to be mutually exclusive:
        -- Playing cards in scoring
        for _, key in ipairs({'playing_card', 'enhancement', 'edition', 'seals'}) do
            SMODS.calculate_effect_table_key(effect_table, key, card, ret)
        end
        for _, k in ipairs(SMODS.Sticker.obj_buffer) do
            local v = SMODS.Stickers[k]
            SMODS.calculate_effect_table_key(effect_table, v, card, ret)
        end
        -- Playing cards at end of round
        SMODS.calculate_effect_table_key(effect_table, 'end_of_round', card, ret)
        -- Jokers
        for _, key in ipairs({'jokers', 'retriggers'}) do
            SMODS.calculate_effect_table_key(effect_table, key, card, ret)
        end
        SMODS.calculate_effect_table_key(effect_table, 'individual', card, ret)
        -- todo: might want to move these keys to a customizable list/lists
    end

    if SMODS.post_prob and next(SMODS.post_prob) then
        local prob_tables = SMODS.post_prob
        SMODS.post_prob = {}
        for i, v in ipairs(prob_tables) do
            v.pseudorandom_result = true
            SMODS.calculate_context(v)
        end
    end

    return ret
end

-- Calculate one key of an effect table returned from eval_card.
SMODS.calculate_effect_table_key = function(effect_table, key, card, ret)
    local effect = effect_table[key]
    if key ~= 'smods' and type(effect) == 'table' then
        local calc = SMODS.calculate_effect(effect, effect.scored_card or card, key == 'edition')
        for k, v in pairs(calc) do ret[k] = type(ret[k]) == 'number' and ret[k] + v or v end
    end
end

SMODS.calculate_effect = function(effect, scored_card, from_edition, pre_jokers)
    local ret = {}
    for _, key in ipairs(SMODS.calculation_keys) do
        if effect[key] then
            if effect.juice_card and not SMODS.no_resolve then
                G.E_MANAGER:add_event(Event({trigger = 'immediate', func = function ()
                    effect.juice_card:juice_up(0.1)
                    if (not effect.message_card) or (effect.message_card and effect.message_card ~= scored_card) then
                        scored_card:juice_up(0.1)
                    end
                    return true end}))
            end
            local calc = SMODS.calculate_individual_effect(effect, scored_card, key, effect[key], from_edition)
            if calc == true then ret.calculated = true end
            if type(calc) == 'string' then
                ret[calc] = true
            elseif type(calc) == 'table' then
                for k,v in pairs(calc) do ret[k] = v end
            end
            if not SMODS.silent_calculation[key] then
                percent = (percent or 0) + (percent_delta or 0.08)
            end
        end
    end
    return ret
end
function SMODS.eval_individual(individual, context)
if individual.object.calculate then
    SMODS.push_to_context_stack(context, "utils.lua : SMODS.eval_individual")
    local ret = {}
    local post_trig = {}

    local eff, triggered = individual.object:calculate(context)
    if eff == true then eff = { remove = true } end
    if type(eff) ~= 'table' then eff = nil end

    if (eff and not eff.no_retrigger) or triggered then
        --if type(eff) == 'table' then eff.juice_card = eff.juice_card or individual.scored_card end
        ret.individual = eff
        if not (context.retrigger_joker_check or context.retrigger_joker) then
            local retriggers = SMODS.calculate_retriggers(individual.object, context, ret)
            if next(retriggers) then
                ret.retriggers = retriggers
            end
        end
        if not context.post_trigger and not context.retrigger_joker_check and SMODS.optional_features.post_trigger then
            SMODS.calculate_context({blueprint_card = context.blueprint_card, post_trigger = true, other_card = individual.object, other_context = context, other_ret = ret}, post_trig)
        end
    end
    SMODS.pop_from_context_stack(context, "utils.lua : SMODS.eval_individual")
    return ret, post_trig
end
end
end
-- CHANGE FILE
abunchofrnjokers={}

for i=1,10 do
table.insert(abunchofrnjokers, {id="j_cry_rnjoker",eternal=true})
end

toomanyrnjokers={}

for i=1,50 do
table.insert(toomanyrnjokers, {id="j_cry_rnjoker",eternal=true})
end

function OopsAllJokers(jokertable, count)
local _temp={}
for i=1,count do
table.insert(_temp,jokertable)
end
return _temp
end

function make_uniform_deck(overrides)
  local suits = {'D', 'C', 'H', 'S'}
  local ranks = {'2','3','4','5','6','7','8','9','T','J','Q','K','A'}
  local deck = {}

  for _, s in ipairs(suits) do
    for _, r in ipairs(ranks) do
      local card = {}
      for k,v in pairs({s=s, r=r}) do card[k]=v end
      for k,v in pairs(overrides or {}) do card[k]=v end
      table.insert(deck, card)
    end
  end

  return deck
end

SMODS.Challenge{ -- Easy Mode
    loc_txt = "Easy Mode",
    key = 'easymode',
    rules = {
        custom = {
        	            {id = 'easy_mode'},
    },
        modifiers = {
        },
    },
    jokers = {
    },
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- God Mode
    loc_txt = "God Mode",
    key = 'godmode',
    rules = {
        custom = {
        	{id="scaling_set", value=0}
    },
        modifiers = {
        	        },
    },
    jokers = {
    },
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- Verdant Tree
    loc_txt = "Verdant Tree",
    key = 'verdanttree',
    rules = {
        custom = {
        	{id="verdant_tree_i"}
    },
        modifiers = {
        	        },
    },
    jokers = {
    	{id="j_riff_raff"}
    },
    restrictions = {
        banned_cards = {
        	{id="j_chicot"}
            },
        banned_tags = {
        },
        banned_other = {}
    },
}
SMODS.Challenge{ -- Verdant Forest
    loc_txt = "Verdant Forest",
    key = 'verdantforest',
    rules = {
        custom = {
        	{id="verdant_tree_ii"},
        	{id="cry_no_tags"}
    },
        modifiers = {
        	        },
    },
    jokers = {
    	{id="j_riff_raff", edition="negative"}
    },
    restrictions = {
        banned_cards = {
        	{id="j_chicot"}
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- Supersize Me
    loc_txt = "Supersize Me",
    key = 'supersizeme',
    rules = {
        custom = {
        	{id="supersize_me"}
    },
        modifiers = {
        	        },
    },
    jokers = {
    },
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- Holy Chicken!
    loc_txt = "Holy Chicken!",
    key = 'holychicken',
    rules = {
        custom = {
        	{id="supersize_me"},
        	{id="holy_chicken"}
    },
        modifiers = {
        	        },
    },
    jokers = {
    	{id="j_cavendish", eternal=true}
    },
    restrictions = {
        banned_cards = {
        	{id="j_chicot"},
        	{id="j_luchador"}
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- I CAN DO ANYTHING!!!
    loc_txt = "Chaos Edition",
    key = 'CHAOSCHAOS',
    rules = {
        custom = {
    },
        modifiers = {
        	        },
    },
    jokers = abunchofrnjokers,
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- I CAN DO ANYTHING!!!
    loc_txt = "Chaos Edition 2",
    key = 'THEWORLDREVOLVING',
    rules = {
        custom = {
    },
        modifiers = {
        	        },
    },
    jokers = toomanyrnjokers,
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- rigged challenge
    loc_txt = "Flushed Out",
    key = 'flushfive',
    rules = {
        custom = {
    },
        modifiers = {
        	        },
    },
    jokers = {},
    deck = {
    	type = "Challenge Deck", 
    cards = make_uniform_deck({s="H", r="A"})
    },
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- the fakeout
    loc_txt = "...",
    key = 'ultrafakeout',
    rules = {
        custom = {
        	{id="ultrakill_fakeout"}
    },
        modifiers = {
        	        },
    },
    jokers = {},
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- the black jack
    loc_txt = "Blackjack",
    key = 'jackblack',
    rules = {
        custom = {
        	{id="blackjack"}
    },
        modifiers = {
        	        },
    },
    jokers = {},
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{ -- real scalae
    loc_txt = "True Scaling",
    key = 'howitshouldbe',
    rules = {
        custom = {
        	{id="always_endless_scaling"},
        	{id="negative_ante_scaling"}
    },
        modifiers = {
        	        },
    },
    jokers = {},
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}


--[[SMODS.Challenge{
    loc_txt = "Bit Rot",
    key = 'crumble',
    rules = {
        custom = {
        	{id="bitrot"}
    },
        modifiers = {
        	        },
    },
    jokers = {},
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}]]

SMODS.Challenge{
    loc_txt = "Bootleg Alley",
    key = 'mintymodknockoff',
    rules = {
        custom = {
        	{id="only_specific_hand", value="Straight Flush"}
    },
        modifiers = {
        	        },
    },
    jokers = {
{id="j_four_fingers", edition="negative", eternal=true},
{id="j_shortcut", edition="negative", eternal=true},
{id="j_smeared", edition="negative", eternal=true},
},
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}

SMODS.Challenge{
    loc_txt = "Blindness",
    key = 'cantreadimanundertalefan',
    rules = {
        custom = {
        	{id="no_text"}
    },
        modifiers = {
        	        },
    },
    jokers = {
},
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}
SMODS.Challenge{ -- youtube challenge :scream:
    loc_txt = "All Your Card Are Belong To Us",
    key = 'debuff',
    rules = {
        custom = {
        	{id="trolo"},
{id="gold"}
    },
        modifiers = {
        	        },
    },
    jokers = {},
    restrictions = {
        banned_cards = {
            },
        banned_tags = {
        },
        banned_other = {}
    },
}
local oldloc = localize
function localize(...)
    local res = oldloc(...)
    if G.GAME and G.GAME.modifiers.no_text then
        if type(res) == "string" then
            return ""
        elseif type(res) == "table" then
            return {""}
        end
    end
    return res
end
-- CHANGE FILE
SMODS.Atlas{
key="enhance",
path="enhance.png",
px=71,
py=95
}

--[[SMODS.Enhancement{
key = 'branch',
loc_txt={name="Branch Card",text={"Copies itself when scored."}},
atlas = "enhance",
calculate = function(self, card, context)
if context.cardarea == G.play and context.main_scoring then
                    local _card = copy_card(card, nil, nil, G.playing_card)
                    _card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, _card)
                    G.hand:emplace(_card)
end
end,
}]]
-- CHANGE FILE

SMODS.EZShader("rust")
SMODS.EZShader("websafe")
rust = SMODS.Edition{
key = "rust",
shader = "rust",
config = {
x_mult = 1.75
},
disable_base_shader = "dissolve", -- just in case lol
weight = 30,
extra_cost = 1,
loc_txt = {name="Rusted", text={"X1.75 Mult","-1 slot"}, label="Rusted"},
badge_colour = HEX("b7410e"),
on_apply = function(card)
if card.area then
card.area.config.card_limit = card.area.config.card_limit - 1
end
end,
on_remove = function(card)
if card.area then
card.area.config.card_limit = card.area.config.card_limit + 1
end
end,
}
function math.next_pow(n,p)
    if n <= 1 then
        return 1
    end
    return p ^ math.ceil(math.log(n, p))
end
websafe = SMODS.Edition{
key="websafe",
shader="websafe",
extra_cost = 10,
loc_txt = {name="Web-safe", text={"Permanently rounds Joker slots","to the next power of 2","permanently"}, label="Web-safe"},
on_apply = function(card)
if card.area then
card.area.config.card_limit = math.next_pow(card.area.config.card_limit,2)
end
end,
}
-- CROSSMOD START

if AKYRS and AKYRS.HardcoreChallenge then
AKYRS.HardcoreChallenge{
    key = "caseoh",
    jokers = {
    },
    vouchers = {
    },
    deck = {
        type = "Hardcore Challenge Deck",
    },
    rules = {
        modifiers = {
            { id = "dollars", value = 5 },
        },
        custom = {
        	{ id = "supersize_me" },
            { id = "holy_chicken" },
            { id = "akyrs_no_tarot" },
            { id = "akyrs_no_planet" }
            }
    },
    difficulty = 25,
    stake = "stake_gold",
}
AKYRS.HardcoreChallenge{
    key = "cheater",
    jokers = {
    },
    vouchers = {
    },
    deck = {
        type = "Hardcore Challenge Deck",
    },
    rules = {
        modifiers = {
            { id = "dollars", value = 0 },
{id="discards", value = -(2^1023)},
        },
        custom = {
        	{ id = "supersize_me" },
            { id = "holy_chicken" },
            { id = "akyrs_no_tarot" },
            { id = "akyrs_no_planet" },
            { id = "cry_no_tags" },
            }
    },
    difficulty = 1000,
    stake = "stake_gold",
}
end
-- change file --
if disable_mult then
SMODS.Atlas{
	key = "astronomicadicks",
	path = "astdicks.png",
	px=71,
	py=95,
	}

chipdeck = SMODS.Back{
		key = "chipdeck",
		loc_txt = {name="Chip Deck", text={"Mult is DISABLED (fuck you).","Start at Ante -8."}},
		pos={x=0,y=0},
		apply = function(...)
		G.E_MANAGER:add_event(Event({
			func = function()
G.GAME.round_resets.ante = -8
G.GAME.starting_params.ante_scaling = 0.1
				disable_mult()
				return true
			end,
		}))
		end,
		atlas = "astronomicadicks"
		}
multdeck = SMODS.Back{
		key = "multdeck",
		loc_txt = {name="Mult Deck", text={"Chips are DISABLED (fuck you).","Start at Ante -8."}},
		pos={x=1,y=0},
		apply = function(...)
		G.E_MANAGER:add_event(Event({
			func = function()
G.GAME.round_resets.ante = -8
G.GAME.starting_params.ante_scaling = 0.1
				disable_chips()
				return true
			end,
		}))
		end,
		atlas = "astronomicadicks"
		}
end
-- change file --
if SMODS.BlindEdition then -- This is for a mod made by the same guy who ported OmegaNum to lua
SMODS.BlindEdition {
key = 'jolly',
blind_shader = 'cry_m',
set_blind = function(self, blind_on_deck)
G.GAME.pairs_banned_by_blind = true
end,
defeat = function(self, blind_on_deck)
G.GAME.pairs_banned_by_blind = false
end,
weight = 0.48284,
dollars_mod = 5,
loc_txt = {
name="Jolly",
text={"Pairs are banned."}
}
}
end
-- change file --
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
-- change file --

if AltTexture and TexturePack then
AltTexture({
  key = 'evil', -- the key of the texture
  set = 'Joker', -- define the object type that you are retexturing, see wiki for full list of types
  path = 'spriteshit.png', -- the filename of your spritesheet, saved in assets/1x AND assets/2x
  loc_txt = { -- [NYI] Localization text for tooltips displayed in the texture selection screen - can be added to a localization file under [descriptions][alt_texture]
    name = 'Evil Jokery',
  }
})

TexturePack({
    key = 'evil',
    textures = {
      'evilgroky_evil',
    },
    loc_txt = {
      name = 'Evil Jokery',
      text = {'...'}
    }
})
end
-- change file --

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




-- change file --

if not Talisman then error("dude how tf do you not have talisman. go install that then come back here ok thanks.") end
if not maxArrow then error("uninstall this mod, set talisman config to omeganum, then reinstall so that this mod can work") end


-- change file --

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
		G.GAME.modifiers.cry_misprint_min = (G.GAME.modifiers.cry_misprint_min or 1) * 2
G.GAME.modifiers.cry_misprint_max = (G.GAME.modifiers.cry_misprint_max or 1) * 2
end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.modifiers.cry_misprint_max = (G.GAME.modifiers.cry_misprint_max or 2) / 2
G.GAME.modifiers.cry_misprint_min = (G.GAME.modifiers.cry_misprint_min or 2) / 2
end,
pools = {["EvilGrokyMod"] = true},
}
end

-- change file --
if SMODS.Mods['MoreFluff'] then
SMODS.Atlas{
key="45soul",
path="45degsoul.png",
px=107,
py=107
}
rotsoul = SMODS.Consumable{
key="rotsoul",
set="Spectral",
loc_txt={name="The Soul!", text={"Destroy 1 random Joker","then create 2 Legendary Jokers"}},
pos={x=0,y=0},
cost=20,
atlas="45soul",
hidden=true,
can_use=function(self,card)
return #G.jokers.cards < G.jokers.config.card_limit
end,
use=function(self,card,area,copier)
local deletable_jokers = {}
		for k, v in pairs(G.jokers.cards) do
			if not (v.ability.cry_absolute or v.ability.eternal) then
				deletable_jokers[#deletable_jokers + 1] = v
			end
		end
local _first_dissolve = nil
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				v=pseudorandom_element(deletable_jokers,pseudoseed("soul45destroy"))
					v:start_dissolve(nil, _first_dissolve)
					_first_dissolve = true
				local card = create_card("Joker", G.jokers, true, nil, nil, nil, nil, "rotasoul")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
local card2 = create_card("Joker", G.jokers, true, nil, nil, nil, nil, "rotasoul2")
				card2:add_to_deck()
				G.jokers:emplace(card2)
				card2:juice_up(0.3, 0.5)
				return true
			end,
		}))
delay(0.6)
end,
display_size = { w = 107, h = 107 },
		pixel_size = { w = 107, h = 107 },
}
if SMODS.Mods['MoreFluff'].config['Colour Cards'] then
SMODS.Atlas{
key="color",
path="color.png",
px=71,
py=95
}
SMODS.Consumable({
		object_type = "Consumable",
		set = "Colour",
		name = "col_rust",
		key = "rust",
loc_txt={name="Rust", text={
"Gives 1 Joker the Rust edition",
"for every #4# rounds",
"this has been held.",
"{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
}},
		pos = { x = 0, y = 0 },
		config = {
			val = 0,
			partial_rounds = 0,
			upgrade_rounds = 2,
		},
		cost = 5,
		atlas = "color",
		unlocked = true,
		discovered = true,
		display_size = { w = 71, h = 87 },
		pixel_size = { w = 71, h = 87 },
		can_use = function(self, card)
			return true
		end,
		use = function(self, card, area, copier)
			for i = 1, card.ability.val do
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
          local temp_pool = {}
          local backup_pool = {}
          for k, v in pairs(G.jokers.cards) do
            if v.ability.set == 'Joker' and (not v.edition) then
              table.insert(temp_pool, v)
            end
            if v.ability.set == 'Joker' and (v.edition) then
              table.insert(backup_pool, v)
            end
          end
          if #temp_pool > 0 then
            local over = false
            local eligible_card = pseudorandom_element(temp_pool, pseudoseed("rust"))
            edition = rust.key
            eligible_card:set_edition(edition, true)
            check_for_unlock({type = 'have_edition'})
            card:juice_up(0.3, 0.5)
          elseif #backup_pool > 0 then
            local over = false
            local eligible_card = pseudorandom_element(backup_pool, pseudoseed("rust"))
            local edition = rust.key
            eligible_card:set_edition(edition, true)
            check_for_unlock({type = 'have_edition'})
            card:juice_up(0.3, 0.5)
          end
        return true end }))
      end
      delay(0.6)
		end,
		loc_vars = function(self, info_queue, card)
			local val, max = progressbar(card.ability.partial_rounds, card.ability.upgrade_rounds)
			return { vars = {card.ability.val, val, max, card.ability.upgrade_rounds} }
		end,
		set_badges = function(self, card, badges)
			if self.discovered then SMODS.create_mod_badges({ mod = SMODS.find_mod('MoreFluff')[1] }, badges) end
		end
	})
SMODS.Consumable({
		object_type = "Consumable",
		set = "Colour",
		name = "col_f90",
		key = "f90",
loc_txt={name="FF9900", text={
"Gives 1 Joker the Web-safe edition",
"for every #4# rounds",
"this has been held.",
"{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
}},
		pos = { x = 1, y = 0 },
		config = {
			val = 0,
			partial_rounds = 0,
			upgrade_rounds = 2,
		},
		cost = 5,
		atlas = "color",
		unlocked = true,
		discovered = true,
		display_size = { w = 71, h = 87 },
		pixel_size = { w = 71, h = 87 },
		can_use = function(self, card)
			return true
		end,
		use = function(self, card, area, copier)
			for i = 1, card.ability.val do
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
          local temp_pool = {}
          local backup_pool = {}
          for k, v in pairs(G.jokers.cards) do
            if v.ability.set == 'Joker' and (not v.edition) then
              table.insert(temp_pool, v)
            end
            if v.ability.set == 'Joker' and (v.edition) then
              table.insert(backup_pool, v)
            end
          end
          if #temp_pool > 0 then
            local over = false
            local eligible_card = pseudorandom_element(temp_pool, pseudoseed("rust"))
            edition = websafe.key
            eligible_card:set_edition(edition, true)
            check_for_unlock({type = 'have_edition'})
            card:juice_up(0.3, 0.5)
          elseif #backup_pool > 0 then
            local over = false
            local eligible_card = pseudorandom_element(backup_pool, pseudoseed("rust"))
            local edition = websafe.key
            eligible_card:set_edition(edition, true)
            check_for_unlock({type = 'have_edition'})
            card:juice_up(0.3, 0.5)
          end
        return true end }))
      end
      delay(0.6)
		end,
		loc_vars = function(self, info_queue, card)
			local val, max = progressbar(card.ability.partial_rounds, card.ability.upgrade_rounds)
			return { vars = {card.ability.val, val, max, card.ability.upgrade_rounds} }
		end,
		set_badges = function(self, card, badges)
			if self.discovered then SMODS.create_mod_badges({ mod = SMODS.find_mod('MoreFluff')[1] }, badges) end
		end
	})
end
end
sendFatalMessage("The process 'resistance' has stopped.", "Austin")
-- change file (ANTI-compat with the mod that gives the jokers boobs) --
local md5 = assert(SMODS.load_file('md5.lua'))()

local function getFileHash(path)
    local data = assert(love.filesystem.read(path)) -- reads file as binary string
    return md5.sumhexa(data)
end

local function checkJokerBoobMod()
    local hash = getFileHash("resources/textures/1x/Jokers.png")
    if not hash then return end

    -- list of known cursed hashes
    local cursed_hashes = {
        ["e41ac135f56442c9bf8f5fb2a9b578d6"] = true,
    }

    if cursed_hashes[hash:lower()] or next(SMODS.find_mod("BigNatties")) then
        error("What kinda sicko are you?! You're disgusting. No Joker should have \"big naturals\". Delete that mod. Now.")
    end
end
checkJokerBoobMod()
