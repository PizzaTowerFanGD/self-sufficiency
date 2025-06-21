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
SMODS.ObjectType{
	key="EvilGrokyMod"
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
	}
	
	function egmGameOver()
	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
						delay(0.5)
						G.STATE = G.STATES.GAME_OVER
						G.STATE_COMPLETE = false
						return true 
					end}))
					end
					evilgroky = SMODS.Joker{
	key = 'evilgroky',
	loc_txt={name="EVIL GROKY", text={"+#1# Mult every time","a card","is scored. Increases by","X#2# for each card.", "He/They"}},
	config={extra={mult=1, mult_gain = 1.1}},
	loc_vars = function(self,info_queue,card)
	return {vars={card.ability.extra.mult, card.ability.extra.mult_gain},scale=3}
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
	if retracted_heretical_message then
	message = "I love ULTRAKILL."
	end
	if not retracted_heretical_message and math.random(100) <= 1 then
	retracted_heretical_message = true
	message = "I'm sorry."
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
	end
	}
