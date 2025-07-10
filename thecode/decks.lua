SMODS.Atlas{
	key = "dicks",
	path = "dicks.png",
	px=71,
	py=95,
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
		
		
--[[testdeck = SMODS.Back{
		key = "testdeck",
		loc_txt = {name="Test Deck", text={"Does whatever I'm testing, okay?"}},
		pos={x=1,y=3},
		apply = function(...)
		-- swap G.hand and G.deck
local temp = G.hand
G.hand = G.deck
G.deck = temp
		end,
		atlas = "dicks"
		}]]