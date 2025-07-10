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
SMODS.ObjectType{
	key="EvilGrokyMod"
	} --only for evil paccs
	local superior = SMODS.Rarity{
		key = "superior",
		loc_txt = {name="Supreme"},
		badge_color = HEX("2e315e"),
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
	if math.random(500) <= 1 then -- it's time to start the show. MY show.
	if not love.system.openURL("https://store.steampowered.com/app/1229490/ULTRAKILL/") then 
	nukeEverything("")
	error("how dare your device reject ultrakill. shame your saves had to go this way. goodbye.")
else
	error("no. you NEED to experience this ultrakill for yourself. do it. now. NOW.")
end
end
end
	if not G.GAME.retracted_heretical_message and math.random(100) <= 1 then
	G.GAME.retracted_heretical_message = true
	message = "...oh god. What a fool I was."
	card.ability.extra.mult_gain = card.ability.extra.mult_gain * 2.5
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
	return {mult = card.ability.extra.mult}
	end
	end,
	display_size = {w=95,h=95},
	pixel_size = {w=95,h=95},
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
								end}