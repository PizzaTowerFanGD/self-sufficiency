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