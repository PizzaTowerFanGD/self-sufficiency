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