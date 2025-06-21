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