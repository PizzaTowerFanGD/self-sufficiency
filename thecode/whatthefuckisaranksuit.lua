smodsnorankref = SMODS.has_no_rank
		function SMODS.has_no_rank(...)
		if G.GAME.force_no_suit_rank then return true end
		return smodsnorankref(...)
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